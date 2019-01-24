#include <stdio.h>
#include "libtiff.h"

int open_func(int v)
{
    printf("libtiff 4: open_func\n");
    return v*4;
}

int close_func(int v)
{
    printf("libtiff 4: close_func\n");
    return v*4;
}


