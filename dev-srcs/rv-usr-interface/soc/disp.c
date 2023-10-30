
#include <cstdint>
#include <io-regs.h>

/* Display on FPGA should be implemented here. */
#define CHARS_H 80 // 80*8 = 640
#define CHARS_V 30 // 30*16 = 480

void screen_print( char *str, uint8_t x, uint8_t y )
{
    uint8_t wraddr = y * CHARS_H + x;

    /* On e203, to print a string on the screen,
     * We should write the wraddr register,
     * then write to wrdata register.
     */
    *wraddr_reg = wraddr;

#define _WRITE( x ) *wrdata_reg = x;
    // Which is 96 letters in total.
    while ( *str )
    {
        if ( *str >= 0x20 && *str < 0x7F )
            _WRITE( *str - 0x20 );
        else if ( *str < 0x20 )
            _WRITE( 0 );
        else
            _WRITE( 0x5F );

        str++;
    }
#undef _WRITE
}
