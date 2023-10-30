#ifndef CONFIG_H_
#define CONFIG_H_
#include <stdint.h>

typedef struct s_ui_event_t
{
    uint8_t up : 1;
    uint8_t down : 1;
    uint8_t left : 1;
    uint8_t right : 1;
} ui_event_t; // UI input event

#define WIDTH 640
#define HEIGHT 480

#endif // CONFIG_H_