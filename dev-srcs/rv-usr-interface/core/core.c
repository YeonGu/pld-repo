#include "core-interface.h"
#include "ui-configs.h"
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#ifdef _BUILD_FOR_RV_
#include "io-regs.h"
#include "soc-configs.h"
#endif // _BUILD_FOR_RV_

#ifndef _BUILD_FOR_RV_
extern ui_event_t input_event;
#endif // !_BUILD_FOR_RV_

#ifdef _BUILD_FOR_RV_
enum disp_size_e
{
    SIZE_256,
    SIZE_128,
};
enum cv_core_e
{
    CV_BICUBIC,
    CV_SHARPEN,
    CV_DEFOG,
    CV_IMAGEADJ,
    PROHIBITED,
};
/* IO Register Control */
inline void set_x( uint8_t x )
{
    *setx_reg = x;
}
inline void set_y( uint8_t y )
{
    *sety_reg = y;
}
inline void set_disp_enable( bool en )
{
    settings_reg->enable_disp = en ? 1 : 0;
}
inline void set_disp_size( disp_size_e s )
{
    settings_reg->disp_size = s;
}
inline void select_cv_core( cv_core_e c )
{
    settings_reg->cv_select = c;
}

uint8_t configs_offset_table[ 5 ][ 3 ] = {
    { 0,
      1 },
    { 2 },
    { 3 },
    { 4 },
};
void set_conf_reg( uint8_t idx, bool val )
{
#define SETCONFIG( name )     \
    configs_reg1->name = val; \
    break;
#define CASE( n, o ) \
    case n:          \
        SETCONFIG( o );

    switch ( idx )
    {
        CASE( 0, bcb_mul );
        CASE( 1, bcb_disp_size );
        CASE( 2, shp_disp_size );
        CASE( 3, dfog_disp_size );
        CASE( 4, imadj_disp_size );
    default:
        break;
    }
#undef CASE
#undef SETCONFIG
}
#endif // _BUILD_FOR_RV_

/* Screen print function */
void screen_print( char *str, uint8_t x, uint8_t y );

void init_ui()
{
    screen_print( "  Hyper-Resolution", 10, 10 );
    screen_print( "  Sharpen", 10, 11 );
    screen_print( "  Defog", 10, 12 );
    screen_print( "  Image Adj.", 10, 13 );
    screen_print( "  X DISABLE PROC X", 10, 14 );

    // screen_print( "#", 19, 8 );

    // draw_line( 239, 144, 192, LINE_V );

    // draw_rec( 72, 144, 568, 336 );
}

// 0 - No display
// 1 - Main menu
// 2 - [Submenu]
uint8_t current_layer = 0;

void l0_handler( ui_event_t input_event );
void l1_handler( ui_event_t input_event );
void l2_handler( ui_event_t input_event );
void ( *layer_handler[ 3 ] )( ui_event_t input_event ) = {
    l0_handler,
    l1_handler,
    l2_handler,
};

/* L1 SECTIONS */
char *sub_secs[ 5 ][ 3 ] = {
    // hyper
    {
        "Multiplier",
        "Disp Size",
    },
    // Sharpen
    { "Disp Size" },
    // Defog
    { "Disp Size" },
    // Image Adj.
    { "Disp Size" },
    // Disable Proc.
    {},
};
uint8_t sub_sec_cnt[ 5 ] = { 2, 1, 1, 1, 0 };

char *configs[ 5 ][ 3 ][ 2 ] = {
    {
        { "2x", "4x" },
        { "128", "256" },
    },
    {
        { "2x", "4x" },
    },
    {
        { "2x", "4x" },
    },
    {
        { "2x", "4x" },
    },
    {} };
uint8_t config_cnt[ 5 ][ 3 ] = {
    { 2,
      2 },
    { 2 },
    { 2 },
    { 2 },
    {} };
static uint8_t set_configs[ 5 ][ 3 ];

/**
 * @brief update frame every 60 / 30fps.
 * Called every 1/30s.
 *	(1) Load events, Logic dealing, flush events
 *	(2) Update screen
 *	(3) Pass Args
 *	(4) [Transfer](if needed)
 */

bool update_frame( ui_event_t *input_event )
{
    // screen_print( "    Multiplier     > 2x <", 30, 10 ); // aka. 34

    current_layer = current_layer > 2 ? 0 : current_layer;
    layer_handler[ current_layer ]( *input_event );

    *(uint8_t *) input_event = 0;
    return current_layer;
}

void l0_handler( ui_event_t input_event )
{
    static bool locked = true;
    if ( input_event.right )
    {
        current_layer = 1;
        printf( "L0 RIGHT\n" );
    }
}

static uint8_t l1_sel;
void           l1_handler( ui_event_t input_event )
{
#define NR_SECS 5
#define L1_BASE_X 10
    static bool first_write    = true;
    static bool just_activated = true;
    if ( first_write )
    {
        screen_print( ">", L1_BASE_X, 10 + l1_sel );
        first_write = false;
        for ( int i = 0; i < sub_sec_cnt[ l1_sel ]; i++ )
        {
            screen_print( sub_secs[ l1_sel ][ i ], 34, 10 + i );
            screen_print( configs[ l1_sel ][ i ][ set_configs[ l1_sel ][ i ] ], 52, 10 + i );
        }
    }
    if ( just_activated )
    {
        screen_print( "###", 18, 8 );
        just_activated = false;
    }

    // Dealing with inputs
    if ( input_event.left )
    {
        just_activated = true;
        screen_print( "   ", 18, 8 );
        current_layer = 0;
    }
    else if ( input_event.right )
    {
        just_activated = true;
        screen_print( "   ", 18, 8 );
        current_layer = 2;
    }
    else
    {
        if ( input_event.down )
        {
            for ( int i = 0; i < sub_sec_cnt[ l1_sel ]; i++ )
            {
                screen_print( "          ", 34, 10 + i );
                screen_print( "    ", 52, 10 + i );
            }

            screen_print( " ", L1_BASE_X, 10 + l1_sel );
            l1_sel = l1_sel >= NR_SECS - 1 ? 0 : l1_sel + 1;
            screen_print( ">", L1_BASE_X, 10 + l1_sel );

            for ( int i = 0; i < sub_sec_cnt[ l1_sel ]; i++ )
            {
                screen_print( sub_secs[ l1_sel ][ i ], 34, 10 + i );
                screen_print( configs[ l1_sel ][ i ][ set_configs[ l1_sel ][ i ] ], 52, 10 + i );
            }

#ifdef _BUILD_FOR_RV_
            select_cv_core( l1_sel );
#endif // _BUILD_FOR_RV_
        }
        if ( input_event.up )
        {
            for ( int i = 0; i < sub_sec_cnt[ l1_sel ]; i++ )
            {
                screen_print( "          ", 34, 10 + i );
                screen_print( "    ", 52, 10 + i );
            }
            screen_print( " ", L1_BASE_X, 10 + l1_sel );
            l1_sel = l1_sel == 0 ? NR_SECS - 1 : l1_sel - 1;
            screen_print( ">", L1_BASE_X, 10 + l1_sel );
            for ( int i = 0; i < sub_sec_cnt[ l1_sel ]; i++ )
            {
                screen_print( sub_secs[ l1_sel ][ i ], 34, 10 + i );
                screen_print( configs[ l1_sel ][ i ][ set_configs[ l1_sel ][ i ] ], 52, 10 + i );
            }

#ifdef _BUILD_FOR_RV_
            select_cv_core( l1_sel );
#endif // _BUILD_FOR_RV_
        }
    }
}
void l2_handler( ui_event_t input_event )
{
    static bool    just_activated = true;
    static uint8_t selected       = 0;

#define L2_SELB 50
#define L2_CONFB L2_SELB + 2
    if ( just_activated )
    {
        screen_print( "###", 39, 8 );
        if ( sub_sec_cnt[ l1_sel ] )
            screen_print( ">", L2_SELB, 10 + selected );
        just_activated = false;
    }

    if ( input_event.left )
    {
        screen_print( "   ", 39, 8 );
        just_activated = true;
        current_layer  = 1;
        screen_print( " ", L2_SELB, 10 + selected );
        selected = 0;
    }
    else if ( input_event.down )
    {
        if ( sub_sec_cnt[ l1_sel ] == 0 ) return;
        screen_print( " ", L2_SELB, 10 + selected );
        selected = ( selected == sub_sec_cnt[ l1_sel ] - 1 ) ? 0 : selected + 1;
        screen_print( ">", L2_SELB, 10 + selected );
    }
    else if ( input_event.up )
    {
        if ( sub_sec_cnt[ l1_sel ] == 0 ) return;
        screen_print( " ", L2_SELB, 10 + selected );
        selected = ( selected == 0 ) ? sub_sec_cnt[ l1_sel ] - 1 : selected - 1;
        screen_print( ">", L2_SELB, 10 + selected );
    }
    else if ( input_event.right )
    {
        set_configs[ l1_sel ][ selected ] = set_configs[ l1_sel ][ selected ] == config_cnt[ l1_sel ][ selected ] - 1 ? 0 : set_configs[ l1_sel ][ selected ] + 1;
        screen_print( configs[ l1_sel ][ selected ][ set_configs[ l1_sel ][ selected ] ], L2_CONFB, 10 + selected );

#ifdef _BUILD_FOR_RV_
        set_conf_reg( configs_offset_table[ l1_sel ][ selected ], set_configs[ l1_sel ][ selected ] );
#endif // _BUILD_FOR_RV_
    }
}
