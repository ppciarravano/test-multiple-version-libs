### test-multiple-version-libs

```
// libtiff_3
gcc -Wall -fPIC -c libtiff.c 
gcc -shared -Wl,-soname,libtiff.so.3 -o libtiff.so.3.0 libtiff.o
ar -cvq libtiff.a libtiff.o
ar -t libtiff.a
ln -sf libtiff.so.3.0 libtiff.so.3
ln -sf libtiff.so.3 libtiff.so

// libtiff_4
gcc -Wall -fPIC -c libtiff.c 
gcc -shared -Wl,-soname,libtiff.so.4 -Wl,--version-script=libtiff.map -o libtiff.so.4.0 libtiff.o
ar -cvq libtiff.a libtiff.o
ar -t libtiff.a
readelf -a -W libtiff.so.4.0
ln -sf libtiff.so.4.0 libtiff.so.4
ln -sf libtiff.so.4 libtiff.so

// oiio
g++ -Wall -fPIC -I../libtiff_4  -c oiio.cpp
g++ -shared -Wl,-soname,liboiio.so.1 -o liboiio.so.1.0 oiio.o ../libtiff_4/libtiff.so
readelf -a -w liboiio.so
ln -sf liboiio.so.1.0 liboiio.so.1
ln -sf liboiio.so.1 liboiio.so

// usd
g++ -Wall -fPIC -I../oiio  -c usd.cpp
g++ -shared -Wl,-soname,libusd.so.1 -o libusd.so.1.0 usd.o -L../oiio -loiio
ln -sf libusd.so.1.0 libusd.so.1
ln -sf libusd.so.1 libusd.so

// maya
g++ -Wall -I../libtiff_3 -I../usd  -c maya.cpp
g++ maya.o -o maya ../libtiff_3/libtiff.so ../usd/libusd.so ../oiio/liboiio.so ../libtiff_4/libtiff.so
export LD_LIBRARY_PATH=../libtiff_4:../libtiff_3:../usd:../oiio
----
./maya 
maya main
libtiff 3: open_func
libtiff 3: close_func
libtiff 3: old_tiff_func
usd_function
oiio_function
libtiff 3: open_func
libtiff 3: close_func
end maya main
----
g++ maya.o -o maya ../libtiff_4/libtiff.so ../usd/libusd.so ../oiio/liboiio.so ../libtiff_3/libtiff.so
----
./maya 
maya main
libtiff 4: open_funclibtiff 4: close_funclibtiff 3: old_tiff_func
usd_function
oiio_function
libtiff 4: open_funclibtiff 4: close_funcend maya main
----
```

#### links:

http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html

https://www.gnu.org/software/gnulib/manual/html_node/LD-Version-Scripts.html

https://www.akkadia.org/drepper/dsohowto.pdf

