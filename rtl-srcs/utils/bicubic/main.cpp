#include "Vbicubic_core.h"
#include "Vbicubic_core___024root.h"
#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <verilated.h>
#include <verilated_vcd_c.h>

#define MAX_SIM_TIME 100
#define RESET_TIME 20
#define DUT Vbicubic_core
Vbicubic_core *dut;

vluint64_t sim_time = 0;

void sim_behav();

unsigned int *input_interfaces[4][4];
void init_inputs() {
  input_interfaces[0][0] = &dut->i_raw_pix11;
  input_interfaces[0][1] = &dut->i_raw_pix12;
  input_interfaces[0][2] = &dut->i_raw_pix13;
  input_interfaces[0][3] = &dut->i_raw_pix14;
  input_interfaces[1][0] = &dut->i_raw_pix21;
  input_interfaces[1][1] = &dut->i_raw_pix22;
  input_interfaces[1][2] = &dut->i_raw_pix23;
  input_interfaces[1][3] = &dut->i_raw_pix24;
  input_interfaces[2][0] = &dut->i_raw_pix31;
  input_interfaces[2][1] = &dut->i_raw_pix32;
  input_interfaces[2][2] = &dut->i_raw_pix33;
  input_interfaces[2][3] = &dut->i_raw_pix34;
  input_interfaces[3][0] = &dut->i_raw_pix41;
  input_interfaces[3][1] = &dut->i_raw_pix42;
  input_interfaces[3][2] = &dut->i_raw_pix43;
  input_interfaces[3][3] = &dut->i_raw_pix44;
}

#pragma pack(push, 1)
struct BMPHeader {
  char signature[2];
  uint32_t fileSize;
  uint16_t reserved1;
  uint16_t reserved2;
  uint32_t dataOffset;
  uint32_t headerSize;
  uint32_t width;
  uint32_t height;
  uint16_t planes;
  uint16_t bitsPerPixel;
  uint32_t compression;
  uint32_t imageSize;
  uint32_t xPixelsPerMeter;
  uint32_t yPixelsPerMeter;
  uint32_t colorsUsed;
  uint32_t importantColors;
};
#pragma pack(pop)

void readBMP(const char *filename, uint8_t image[100][100][3]) {
  std::ifstream file(filename, std::ios::binary);

  if (!file) {
    std::cerr << "Failed to open the file." << std::endl;
    return;
  }

  BMPHeader header;
  file.read(reinterpret_cast<char *>(&header), sizeof(BMPHeader));

  if (header.signature[0] != 'B' || header.signature[1] != 'M') {
    std::cerr << "Invalid BMP file format." << std::endl;
    file.close();
    return;
  }

  if (header.width != 100 || header.height != 100 ||
      header.bitsPerPixel != 24) {
    std::cerr << "Invalid image dimensions or color depth." << std::endl;
    file.close();
    return;
  }

  file.seekg(header.dataOffset, std::ios::beg);

  for (int row = 99; row >= 0; --row) {
    for (int col = 0; col < 100; ++col) {
      uint8_t b, g, r;
      file.read(reinterpret_cast<char *>(&b), sizeof(uint8_t));
      file.read(reinterpret_cast<char *>(&g), sizeof(uint8_t));
      file.read(reinterpret_cast<char *>(&r), sizeof(uint8_t));

      image[row][col][0] = r;
      image[row][col][1] = g;
      image[row][col][2] = b;
    }
  }

  file.close();
}

static uint8_t image[100][100][3];

int main(int argc, char **argv, char **env) {
  // 新建需要仿真的对象
  dut = new Vbicubic_core;
  init_inputs();

  // 生成仿真波形, "vcd"文件
  Verilated::traceEverOn(true);
  VerilatedVcdC *m_trace = new VerilatedVcdC;
  dut->trace(m_trace, 5);
  m_trace->open("waveform.vcd");

  readBMP("img.bmp", image);

  while (sim_time < MAX_SIM_TIME) {
    // 翻转时钟
    dut->i_bicubic_clk ^= 1;
    if (sim_time >= RESET_TIME) {
      dut->rst_n = 1;
    }
    sim_behav();
    dut->eval();
    m_trace->dump(sim_time);
    sim_time++;
  }

  m_trace->close();
  delete dut;
  delete m_trace;
  exit(EXIT_SUCCESS);
}

void sim_behav() {
  if (sim_time < RESET_TIME || !dut->i_bicubic_clk)
    return;

  for (size_t i = 0; i < 4; i++) {
    for (size_t j = 0; j < 4; j++) {
      *input_interfaces[i][j] = rand();
    }
  }
}