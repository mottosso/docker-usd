# Unofficial Dockerfile for the Public Beta of Pixar's USD file format.
# http://graphics.pixar.com/usd/

FROM centos:6.7
 
MAINTAINER marcus@abstractfactory.io
 
# Install dependencies
RUN yum update -y && yum install -y \
      groupinstall "Development Tools" \
      zlib-devel \
      glibc-devel.i686 \
      wget
 
# Download and unpack distribution first; Docker's caching
# mechanism will ensure that this only happens once.
RUN wget http://graphics.pixar.com/usd/files/usd-20151216.tar.gz -O usd.tgz && \
    wget http://graphics.pixar.com/usd/files/deps-vfx2015.tar.gz -O usd-deps.tgz && \
    mkdir -r /opt/pixar && \
      tar -xvf usd.tgz -C /opt/pixar/ && \
      tar -xvf usd-deps.tgz -C /opt/pixar/ && \
    rm usd.tgz && \
    rm usd-deps.tgz

# Build dependencies; takes a long time.
RUN mkdir ~/Downloads && \
    wget https://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz  -O ~/Downloads/binutils.tgz && \
    wget https://ftp.gnu.org/gnu/gcc/gcc-4.8.2/gcc-4.8.2.tar.gz -O ~/Downloads/gcc.tgz && \
    wget http://www.mpfr.org/mpfr-3.1.2/mpfr-3.1.2.tar.gz       -O ~/Downloads/mpfr.tgz && \
    wget https://ftp.gnu.org/gnu/gmp/gmp-5.1.2.tar.bz2          -O ~/Downloads/gmp.bz2 && \
    wget https://ftp.gnu.org/gnu/mpc/mpc-1.0.1.tar.gz           -O ~/Downloads/mpc.tgz && \
    wget http://pkgs.fedoraproject.org/repo/pkgs/nss_db/db-4.7.25.NC.tar.gz/073ab7f20d24b3872a51ca762f5090e7/db-4.7.25.NC.tar.gz -O ~/Downloads/db4.tgz && \
      tar -xvf ~/Downloads/binutils.tgz -C ~/Downloads && \
      tar -xvf ~/Downloads/gcc.tgz      -C ~/Downloads && \
      tar -xvf ~/Downloads/mpfr.tgz     -C ~/Downloads && \
      tar -xvf ~/Downloads/gmp.bz2      -C ~/Downloads && \
      tar -xvf ~/Downloads/mpc.tgz      -C ~/Downloads && \
      tar -xvf ~/Downloads/db4.tgz      -C ~/Downloads && \
    /opt/pixar/usd/bin/build_deps.sh ~/Downloads

# Initialise USD environment
RUN echo ". /opt/pixar/usd/bin/activate.sh" >> ~/.bashrc

# Finalise
WORKDIR /root