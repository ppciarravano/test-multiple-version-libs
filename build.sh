set -x

rm libtiff_3/*.so* libtiff_3/*.o libtiff_3/*.a
rm libtiff_4/*.so* libtiff_4/*.o libtiff_4/*.a
rm oiio/*.so* oiio/*.o
rm usd/*.so* usd/*.o 
rm maya/*.o
rm maya/maya  
#exit

cd  libtiff_3
gcc -Wall -fPIC -c libtiff.c 
gcc -shared -Wl,--default-symver -Wl,-soname,libtiff.so.3 -o libtiff.so.3.0 libtiff.o
#ar -cvq libtiff.a libtiff.o
#ar -t libtiff.a
ldconfig -N -f ../ld.so.conf
ln -fs libtiff.so.3 libtiff.so
#ln -sf libtiff.so.3.0 libtiff.so.3
cd ..

cd libtiff_4
gcc -Wall -fPIC -c libtiff.c 
#gcc -shared -Wl,--default-symver -Wl,-soname,libtiff.so.4 -o libtiff.so.4.0 libtiff.o
#gcc -shared -Wl,--default-symver -Wl,-soname,libtiff.so.4 -Wl,--version-script=libtiff.map -o libtiff.so.4.0 libtiff.o
#ar -cvq libtiff.a libtiff.o
#ar -t libtiff.a
#readelf -a -W libtiff.so.4.0
#ln -sf libtiff.so.4.0 libtiff.so.4
#ln -sf libtiff.so.4 libtiff.so
gcc -shared -Wl,--default-symver -Wl,-soname,libtiff.so.4 -o libtiff.so.4.0 libtiff.o
ldconfig -N -f ../ld.so.conf
ln -fs libtiff.so.4 libtiff.so
cd ..

cd oiio
g++ -Wall -fPIC -I../libtiff_4  -c oiio.cpp
#g++ -shared -Wl,-soname,liboiio.so.1 -o liboiio.so.1.0 oiio.o ../libtiff_4/libtiff.so
#g++ -shared -Wl,-soname,liboiio.so.1 -o liboiio.so.1.0 oiio.o ../libtiff_4/libtiff.a
#g++ -shared -Wl,-soname,liboiio.so.1 -o liboiio.so.1.0 oiio.o -Wl,--whole-archive ../libtiff_4/libtiff.a -Wl,--no-whole-archive
#readelf -a -w liboiio.so
#ln -sf liboiio.so.1.0 liboiio.so.1
#ln -sf liboiio.so.1 liboiio.so
g++ -Wl,-rpath=. -Wl,--default-symver -Wl,-soname,liboiio.so.1 -shared -o liboiio.so.1.0 oiio.o ../libtiff_4/libtiff.so.4.0
ldconfig -N -f ../ld.so.conf
ln -fs liboiio.so.1 liboiio.so
cd ..

cd usd
g++ -Wall -fPIC -I../oiio  -c usd.cpp
#g++ -shared -Wl,-soname,libusd.so.1 -o libusd.so.1.0 usd.o -L../oiio -loiio
#ln -sf libusd.so.1.0 libusd.so.1
#ln -sf libusd.so.1 libusd.so
g++ -Wl,-rpath=. -Wl,--default-symver -Wl,-soname,libusd.so.1 -shared -o libusd.so.1.0 usd.o -L../oiio -loiio
ldconfig -N -f ../ld.so.conf
ln -fs libusd.so.1 libusd.so
cd ..

cd maya
#g++ -Wall -I../libtiff_3 -I../usd  -c maya.cpp
#g++ maya.o -o maya ../libtiff_3/libtiff.so ../usd/libusd.so ../oiio/liboiio.so ../libtiff_4/libtiff.so
g++ -Wall -I../libtiff_3  -c maya.cpp
g++ -Wl,-rpath=. -o maya maya.o  -ldl ../libtiff_3/libtiff.so.3.0
cd ..


