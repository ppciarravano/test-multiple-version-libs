#include <stdio.h>
#include "usd.h"
#include "oiio.h"

int usd_function(int v)
{
    printf("usd_function\n");
    // Call oiio
    oiio_function(34);
    return v*5;
}

