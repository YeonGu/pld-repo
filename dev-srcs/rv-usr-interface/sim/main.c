#include "core-interface.h"
#include "ui-configs.h"
#include <SDL2/SDL.h>
#include <SDL2/SDL_events.h>
#include <SDL2/SDL_render.h>
#include <SDL2/SDL_video.h>
#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <sys/time.h>
#include <time.h>

// A - Left - 4
// W - 26
// S - 22
// D - 7
enum Keys
{
    UP    = 26,
    DOWN  = 22,
    LEFT  = 4,
    RIGHT = 7,
    // ENTER = 40,
    // BACK  = 42,
};
int         key_lut[]      = { UP, DOWN, LEFT, RIGHT };
const char *key_name_lut[] = { "UP", "DOWN", "LEFT", "RIGHT" };

uint32_t   vmem[ 640 * 480 ];
uint32_t   blank[ 640 * 480 ];
ui_event_t input_event;

SDL_Renderer *renderer;
SDL_Texture  *texture;

int  scan_input();
void render( bool en );
void cycle_entry();
void draw_rec( uint16_t xlt, uint16_t ylt, uint16_t xrb, uint16_t yrb );

bool update_frame();
void init_ui();

uint64_t get_time_ms()
{
    struct timeval tv;
    gettimeofday( &tv, NULL );
    uint64_t milliseconds = ( tv.tv_sec * 1000 ) + ( tv.tv_usec / 1000 );
    return milliseconds;
}

int main()
{
    if ( SDL_Init( SDL_INIT_VIDEO ) != 0 )
    {
        printf( "SDL Init failed.\n" );
        return 1;
    }

    SDL_Window *sdlwindow = SDL_CreateWindow(
        "RISCV UI EMULATOR",     // 窗口标题
        SDL_WINDOWPOS_UNDEFINED, // 窗口的初始位置
        SDL_WINDOWPOS_UNDEFINED,
        640,             // 窗口的宽度
        480,             // 窗口的高度
        SDL_WINDOW_SHOWN // 窗口的显示标志
    );

    if ( !sdlwindow )
    {
        printf( "窗口创建失败: %s\n", SDL_GetError() );
        return 1;
    }
    renderer = SDL_CreateRenderer( sdlwindow, -1, SDL_RENDERER_ACCELERATED );
    texture  = SDL_CreateTexture( renderer, SDL_PIXELFORMAT_ABGR8888, SDL_TEXTUREACCESS_STREAMING, 640, 480 );
    assert( texture && renderer );

    init_ui();
    while ( 1 )
    {
        static uint64_t timer;
        while ( get_time_ms() - timer < 1000 / 30 )
            ;
        timer = get_time_ms();

        if ( scan_input() == -1 )
        {
            SDL_DestroyWindow( sdlwindow );
            return 0;
        }

        render( update_frame( &input_event ) );

        // i++;
    }

    int c = getchar();
    printf( "Hello!\n" );
}

void render( bool en )
{
    SDL_UpdateTexture( texture, NULL, en ? vmem : blank, 2560 );
    SDL_RenderClear( renderer );
    SDL_RenderCopy( renderer, texture, NULL, NULL );
    SDL_RenderPresent( renderer );
}
int scan_input()
{
    SDL_Event event;
    while ( SDL_PollEvent( &event ) )
    {
        if ( event.type == SDL_QUIT )
            return -1;
        switch ( event.type )
        {
        case SDL_KEYDOWN:
            printf( "KEY %d is down.\n", event.key.keysym.scancode );
            for ( size_t i = 0; i < sizeof( key_lut ) / sizeof( key_lut[ 0 ] ); i++ )
            {
                if ( event.key.keysym.scancode == key_lut[ i ] )
                {
                    printf( "get key %s\n", key_name_lut[ i ] );
                    *(uint8_t *) &input_event |= ( 1 << i );
                }
            }

            break;
        }
    }
    return 0;
}