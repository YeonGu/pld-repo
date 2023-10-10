#include "obj_dir/Vbicubic_core.h"
#include "opencv2/core/hal/interface.h"
#include "opencv2/core/mat.hpp"
#include "opencv2/core/matx.hpp"
#include "opencv2/imgcodecs.hpp"
#include <cstdint>
#include <opencv4/opencv2/opencv.hpp>

extern unsigned int  *input_interfaces[ 4 ][ 4 ];
extern unsigned int  *output_interfaces[ 2 ][ 2 ];
extern Vbicubic_core *dut;

uint32_t to_rgb( cv::Vec3b point )
{
    return ( point[ 2 ] << 16 ) | ( point[ 1 ] << 8 ) | point[ 0 ];
}
cv::Vec3b to_point( uint32_t rgb )
{
    return cv::Vec3b( rgb & 0xFF, rgb >> 8 & 0xFF, rgb >> 16 & 0xFF );
}

cv::Mat imageMat;
void    sim_init()
{
    imageMat = cv::imread( "img.bmp", cv::IMREAD_COLOR );
    std::cout << "=============================\nSIM INIT..." << std::endl;
    if ( imageMat.empty() )
    {
        std::cout << "Unable to load image file!" << std::endl;
        assert( 0 );
    }
    std::cout << "Load image file success!" << std::endl;

    if ( imageMat.cols != 100 || imageMat.rows != 100 )
    {
        std::cout << "Image Size not right. Limited to 100 * 100." << std::endl;
        assert( 0 );
    }
    std::cout << "Image size checked." << std::endl;
}

cv::Mat res( 200, 200, CV_8UC3 );
void    sim_behav()
{
    if ( !dut->i_bicubic_clk || !( dut->rst_n ) )
        return;

    static int row = 0;
    static int col = 0;

    for ( int i = 0; i < 4; ++i )
    {
        for ( int j = 0; j < 4; ++j )
        {
            *input_interfaces[ i ][ j ] = to_rgb( imageMat.at<cv::Vec3b>( row + i, col + j ) );
        }
    }

    for ( int i = 0; i < 2; ++i )
        for ( int j = 0; j < 2; ++j )
            res.at<cv::Vec3b>( row * 2 + i, col * 2 + j ) = to_point( *output_interfaces[ i ][ j ] );

    col = ( col == 99 - 4 ) ? 0 : col + 1;
    row = ( col == 0 ) ? row + 1 : row;
}