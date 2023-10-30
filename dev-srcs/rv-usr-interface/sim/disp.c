
#include <core-interface.h>
#include <stdio.h>



extern uint32_t vmem[ 640 * 480 ];
extern uint8_t  fonts[ 256 ][ 16 ];

void draw_line( uint16_t x, uint16_t y, uint32_t len, enum LINE_DIR dir )
{
    uint32_t *draw_p = vmem + y * 640 + x;
    int       inc    = ( dir == LINE_H ) ? 1 : 640;

    while ( len-- )
    {
        *draw_p = 0xFFFFFFFF;
        draw_p += inc;
    }
}

void draw_rec( uint16_t xlt, uint16_t ylt, uint16_t xrb, uint16_t yrb )
{
    if ( xlt > xrb || ylt > yrb || xrb > 639 || yrb > 479 )
        return;

    draw_line( xlt, ylt, xrb - xlt, LINE_H );
    draw_line( xlt, yrb, xrb - xlt, LINE_H );
    draw_line( xlt, ylt, yrb - ylt, LINE_V );
    draw_line( xrb, ylt, yrb - ylt, LINE_V );
}

void draw_bitmap( uint8_t *src, int size_x, int size_y, int start_x, int start_y )
{
    // SRC TAKES IN THE BITMAP.
    for ( int y = start_y; y < start_y + size_y; y++ )
    {
        uint8_t btm = *src;
        for ( int x = start_x; x < start_x + size_x; x++ )
        {
            vmem[ y * 640 + x ] = ( btm & 0x80 ) ? ( -1 ) : 0;
            btm <<= 1;
        }
        src++;
    }
}

void draw_char( char c, uint8_t x, uint8_t y )
{
    draw_bitmap( fonts[ c - 0x20 ], 8, 16, x * 8, y * 16 );
}
