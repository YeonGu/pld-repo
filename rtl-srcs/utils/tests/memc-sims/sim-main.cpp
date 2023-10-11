#include "Vmemc.h"           // Defined by TOP
#include "Vmemc___024root.h" // Defined by TOP
#include <iostream>
#include <stdlib.h>
#include <verilated.h>
#include <verilated_vcd_c.h>

#define MAX_SIM_TIME 4000
#define RESET_TIME 20
#define DUT Vmemc
DUT *dut;

vluint64_t sim_time = 0;

// void sim_init();
// void sim_behav();
int main( int argc, char **argv, char **env )
{
    // 新建需要仿真的对象
    dut = new DUT;

    // 生成仿真波形, "vcd"文件
    Verilated::traceEverOn( true );
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace( m_trace, 5 );
    m_trace->open( "waveform.vcd" );

    // sim_init();

    while ( sim_time < MAX_SIM_TIME )
    {
        // 翻转时钟
        // dut->sys_clk_p ^= 1;
        // if ( sim_time >= RESET_TIME )
        //{
        //    dut->rst_n = 1;
        //}
        // sim_behav();
        dut->eval();
        m_trace->dump( sim_time );
        sim_time++;
    }

    m_trace->close();
    delete dut;
    delete m_trace;
    exit( EXIT_SUCCESS );
}