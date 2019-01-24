#include <stdio.h>
#include "libtiff.h"

int open_func(int v)
{
    printf("libtiff 3: open_func\n");
    return v*11;
}

int close_func(int v)
{
    printf("libtiff 3: close_func\n");
    return v*11;
}

int old_tiff_func(int v)
{
    printf("libtiff 3: old_tiff_func\n");
    return v*11;
}


