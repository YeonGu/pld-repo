#include "core-interface.h"
#include "ui-configs.h"
#include <stdint.h>
#include <stdio.h>

// 0 - No display
// 1 - Main menu
// 2 - [Submenu]

void draw_pixel( int x, int y, uint8_t ); // Implement in platform code

void load_events( ui_event_t *event )
{

    // Clear event flag
    // *(uint8_t *) event = 0;
}

void update_frame() {}
