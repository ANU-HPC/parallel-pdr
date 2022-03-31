
apt-get update
apt-get install --no-install-recommends -y wget \
 build-essential \
 make \
 ca-certificates \
 vim \
 libboost-all-dev\
 autotools-dev\
 autoconf\
 libfl-dev
apt-get install --no-install-recommends -y wget \
 automake
apt-get install --no-install-recommends -y wget \
 autogen
apt-get install --no-install-recommends -y wget \
 libtool
apt-get install --no-install-recommends -y wget \
 valgrind
apt-get install --no-install-recommends -y wget \
 gdb
wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.0.tar.bz2
tar -xvf openmpi-4.0.0.tar.bz2
cd openmpi-4.0.0 && ./configure --prefix=/usr/local && make all install
ldconfig

wget https://github.com/google/glog/archive/v0.4.0.tar.gz \
    && tar -xzf v0.4.0.tar.gz \
    && cd glog-0.4.0 \
    && ./autogen.sh \
    && ./configure \
    && make -j 8 \
    && make install \
    && ldconfig

wget http://davidkebo.com/source/cudd_versions/cudd-3.0.0.tar.gz\
    && tar -zxf cudd-3.0.0.tar.gz\
    && cd cudd-3.0.0\
    && ./configure\
    && make -j 8\
    && make install
