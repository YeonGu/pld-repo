#include "Vmemc.h"           // Defined by TOP
#include "Vmemc___024root.h" // Defined by TOP
#include <iostream>
#include <stdlib.h>
#include <verilated.h>
#include <verilated_vcd_c.h>

#define DUT Vmemc

DUT *dut;

vluint64_t sim_time = 0;

int main( int argc, char **argv, char **env )
{
    VerilatedContext *Contextp = new VerilatedContext;
    Contextp->commandArgs( argc, argv );
    Contextp->traceEverOn( true );

    dut = new DUT{ Contextp };

    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace( m_trace, 5 );
    m_trace->open( "waveform.vcd" );

    int max_time = 3000;
    while ( max_time-- )
    {
        dut->eval();
        m_trace->dump( Contextp->time() );
        Contextp->timeInc( 1 );
    }

    dut->final();

    m_trace->close();
    delete dut;
    delete m_trace;
    exit( EXIT_SUCCESS );
}