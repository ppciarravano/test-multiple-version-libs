### test-multiple-version-libs

```
         dlopen/dlsym
maya ------------------->> usd --> oiio --> libtif4
 |
 |--> libtif3


./build.sh
export LD_LIBRARY_PATH=../libtiff_4:../libtiff_3:../usd:../oiio
cd maya
./maya

```

#### links:

http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html

https://www.gnu.org/software/gnulib/manual/html_node/LD-Version-Scripts.html

https://www.akkadia.org/drepper/dsohowto.pdf

https://blog.habets.se/2012/05/Shared-libraries-diamond-problem.html

https://github.com/ThomasHabets/diamond_linking_example

https://www.tldp.org/HOWTO/html_single/C++-dlopen/

http://tldp.org/HOWTO/Program-Library-HOWTO/dl-libraries.html

https://amir.rachum.com/blog/2016/09/17/shared-libraries/

http://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_3.html









