#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>
// include libtiff 3
#include "libtiff.h"
//#include "usd.h"

int main()
{
    printf("maya main\n");

    // calls libtiff3
    open_func(3);
    close_func(3);
    old_tiff_func(3);

    // call usd without plugin
    //usd_function(5);

    printf("----- start dynamic load of libusd.so\n");
    void *handle;
    int (*usd_function)(int);
    char *error;
    handle = dlopen ("./usd/libusd.so", RTLD_LAZY);
    if (!handle) {
        fputs (dlerror(), stderr);
        exit(1);
    }
    usd_function = (int(*)(int))dlsym(handle, "usd_function");
    if ((error = dlerror()) != NULL)  {
        fputs(error, stderr);
        exit(1);
    }
    printf ("%d\n", (*usd_function)(342));
    printf("end test libusd.so\n");
   
    printf("end maya main\n");
    return 0;
}





