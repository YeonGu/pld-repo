#include "Vbicubic_core.h"
#include "Vbicubic_core___024root.h"
#include "opencv2/imgcodecs.hpp"
#include <fstream>
#include <iostream>
#include <opencv4/opencv2/opencv.hpp>
#include <stdlib.h>
#include <verilated.h>
#include <verilated_vcd_c.h>

#define MAX_SIM_TIME 18000
#define RESET_TIME 20
#define DUT Vbicubic_core
Vbicubic_core *dut;

vluint64_t sim_time = 0;

void sim_behav();

unsigned int *input_interfaces[ 4 ][ 4 ];
unsigned int *output_interfaces[ 2 ][ 2 ];
void          init_inputs()
{
    input_interfaces[ 0 ][ 0 ]  = &dut->i_raw_pix11;
    input_interfaces[ 0 ][ 1 ]  = &dut->i_raw_pix12;
    input_interfaces[ 0 ][ 2 ]  = &dut->i_raw_pix13;
    input_interfaces[ 0 ][ 3 ]  = &dut->i_raw_pix14;
    input_interfaces[ 1 ][ 0 ]  = &dut->i_raw_pix21;
    input_interfaces[ 1 ][ 1 ]  = &dut->i_raw_pix22;
    input_interfaces[ 1 ][ 2 ]  = &dut->i_raw_pix23;
    input_interfaces[ 1 ][ 3 ]  = &dut->i_raw_pix24;
    input_interfaces[ 2 ][ 0 ]  = &dut->i_raw_pix31;
    input_interfaces[ 2 ][ 1 ]  = &dut->i_raw_pix32;
    input_interfaces[ 2 ][ 2 ]  = &dut->i_raw_pix33;
    input_interfaces[ 2 ][ 3 ]  = &dut->i_raw_pix34;
    input_interfaces[ 3 ][ 0 ]  = &dut->i_raw_pix41;
    input_interfaces[ 3 ][ 1 ]  = &dut->i_raw_pix42;
    input_interfaces[ 3 ][ 2 ]  = &dut->i_raw_pix43;
    input_interfaces[ 3 ][ 3 ]  = &dut->i_raw_pix44;
    output_interfaces[ 0 ][ 0 ] = &dut->o_res_pix11;
    output_interfaces[ 0 ][ 1 ] = &dut->o_res_pix12;
    output_interfaces[ 1 ][ 0 ] = &dut->o_res_pix21;
    output_interfaces[ 1 ][ 1 ] = &dut->o_res_pix22;
}

extern cv::Mat res;

void sim_init();
void sim_behav();
int  main( int argc, char **argv, char **env )
{
    // 新建需要仿真的对象
    dut = new Vbicubic_core;
    init_inputs();

    // 生成仿真波形, "vcd"文件
    Verilated::traceEverOn( true );
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace( m_trace, 5 );
    m_trace->open( "waveform.vcd" );

    sim_init();

    while ( sim_time < MAX_SIM_TIME )
    {
        // 翻转时钟
        dut->i_bicubic_clk ^= 1;
        if ( sim_time >= RESET_TIME )
        {
            dut->rst_n = 1;
        }
        sim_behav();
        dut->eval();
        m_trace->dump( sim_time );
        sim_time++;
    }

    cv::imwrite( "output.bmp", res );
    m_trace->close();
    delete dut;
    delete m_trace;
    exit( EXIT_SUCCESS );
}
