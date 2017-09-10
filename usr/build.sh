g++ -fPIC -shared -I/usr/local/include /usr/local/lib/libgdal.so.20.1.2  $(pwd)/src/processor/*.cc -o  $(pwd)/build/proc.so ;
