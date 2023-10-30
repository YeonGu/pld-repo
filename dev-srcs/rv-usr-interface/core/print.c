
#include <core-interface.h>
#include <ui-configs.h>

// 80(H) 30(V)
void screen_print( char *str, uint8_t x, uint8_t y )
{
    x = x >= 80 ? 79 : x;
    y = y >= 30 ? 29 : y;

    while ( *str )
    {
        draw_char( *( str++ ), x++, y );
    }
}
