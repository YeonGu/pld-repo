#ifndef _CORE_ITFC
#define _CORE_ITFC

#include <stdint.h>
#include <ui-configs.h>

enum LINE_DIR
{
    LINE_H,
    LINE_V,
};

// Interface for C code

// ui_event_t get_inputs();

void draw_rec( uint16_t xlt, uint16_t ylt, uint16_t xrb, uint16_t yrb );
void draw_bitmap( uint8_t *src, int size_x, int size_y, int start_x, int start_y );
void draw_pixel( int x, int y, uint8_t ); // Implement in platform code
void draw_char( char c, uint8_t x, uint8_t y );
void draw_line( uint16_t x, uint16_t y, uint32_t len, enum LINE_DIR dir );

#endif /*end of _CORE_ITFC*/