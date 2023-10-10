#include "core-interface.h"
#include "ui-configs.h"
#include <SDL2/SDL.h>
#include <SDL2/SDL_events.h>
#include <SDL2/SDL_render.h>
#include <assert.h>
#include <stdint.h>
#include <stdio.h>

// A - Left - 4
// W - 26
// S - 22
// D - 7
// Enter - 40
// Backspace - 42
enum Keys
{
    UP    = 26,
    DOWN  = 22,
    LEFT  = 4,
    RIGHT = 7,
    ENTER = 40,
    BACK  = 42,
};
int         key_lut[]      = { UP, DOWN, LEFT, RIGHT, ENTER, BACK };
const char *key_name_lut[] = { "UP", "DOWN", "LEFT", "RIGHT", "ENTER", "BACK" };

uint32_t   vmem[ 1024 * 768 ];
ui_event_t input_event;

SDL_Renderer *renderer;
SDL_Texture  *texture;

int  scan_input();
void render();
void cycle_entry();
int  main()
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
        1024,            // 窗口的宽度
        768,             // 窗口的高度
        SDL_WINDOW_SHOWN // 窗口的显示标志
    );

    if ( !sdlwindow )
    {
        printf( "窗口创建失败: %s\n", SDL_GetError() );
        return 1;
    }
    renderer = SDL_CreateRenderer( sdlwindow, -1, SDL_RENDERER_ACCELERATED );
    texture  = SDL_CreateTexture( renderer, SDL_PIXELFORMAT_ABGR8888, SDL_TEXTUREACCESS_STREAMING, 1024, 768 );
    assert( texture && renderer );

    while ( 1 )
    {
        static int i;

        if ( i == 1024 * 768 )
        {
            return 0;
        }
        vmem[ i ] = -1;

        if ( scan_input() == -1 )
        {
            return 0;
        }

        cycle_entry();
        render();

        i++;
    }

    int c = getchar();
    printf( "Hello!\n" );
}

void render()
{
    SDL_UpdateTexture( texture, NULL, vmem, 1024 * 4 );
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