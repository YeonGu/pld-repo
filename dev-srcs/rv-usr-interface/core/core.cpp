#include "core-interface.h"
#include <functional>
#include <stdio.h>
#include <vector>

void a()
{
    printf( "Hello from CPP!\n" );

    std::vector<int> b;
    b.emplace_back( 2 );
    b.emplace_back( 3 );
    b.emplace_back( 4 );
    for ( auto i : b )
    {
        printf( "%d\n", i );
    }

    std::function<void()> f = []() {
        printf( "HELLO FROM Lambda expr\n" );
    };
    f();

}
