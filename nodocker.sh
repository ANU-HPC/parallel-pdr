# Taken from dagster: https://github.com/ANU-HPC/dagster
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
