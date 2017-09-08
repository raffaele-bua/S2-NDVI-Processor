FROM debian

# Create app directory
RUN mkdir -p /usr/project

# install depenpendencies
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y build-essential
RUN apt-get install -y unzip
RUN apt-get install -y cmake

#install openjpeg
WORKDIR /usr
RUN mkdir -p /usr/openjpeg
WORKDIR /usr/openjpeg
COPY vendors/openjpeg-2.1.1.zip /usr/openjpeg
RUN unzip openjpeg-2.1.1.zip
WORKDIR /usr/openjpeg/openjpeg-2.1.1
RUN mkdir build
WORKDIR /usr/openjpeg/openjpeg-2.1.1/build
RUN cmake ..
RUN make
RUN make install
RUN make clean
RUN ln -s /usr/local/lib/libopenjp2.so.7 /usr/lib/
WORKDIR /usr
RUN rm -rf /usr/openjpeg

#install gdal
WORKDIR /usr
RUN mkdir -p /usr/gdal
WORKDIR /usr/gdal
COPY vendors/gdal212.zip /usr/gdal
RUN unzip gdal212.zip
WORKDIR /usr/gdal/gdal-2.1.2
RUN ./configure --with-openjpeg=/usr/local
RUN make
RUN make install
WORKDIR /usr
RUN rm -rf gdal

#install wget
RUN apt-get install -y wget


## install valgrind
RUN apt-get install -y valgrind

RUN apt-get install -y vim


WORKDIR /usr/project/
