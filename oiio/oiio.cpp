#include <stdio.h>
#include "oiio.h"
#include "libtiff.h"

int oiio_function(int v)
{
    printf("oiio_function\n");
    // Call tiff 4
    open_func(3);
    close_func(3);
    return v*2;
}

