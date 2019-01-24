#include <stdio.h>
// include libtiff 3
#include "libtiff.h"
#include "usd.h"

int main()
{
    printf("maya main\n");

    // calls libtiff3
    open_func(3);
    close_func(3);
    old_tiff_func(3);

    // call usd
    usd_function(5);
   
    printf("end maya main\n");
    return 0;
}





