ARG tag=eoan

FROM lballabio/boost:${tag}

MAINTAINER Suhas Ghorpadkar

LABEL Description="QuantLib C++ library compiled for Java bindings"



ARG quantlib_version=1.19

ENV quantlib_version ${quantlib_version}



RUN wget https://dl.bintray.com/quantlib/releases/QuantLib-${quantlib_version}.tar.gz \
    && tar xfz QuantLib-${quantlib_version}.tar.gz \
    && rm QuantLib-${quantlib_version}.tar.gz \
    && cd QuantLib-${quantlib_version} \
    && ./configure --prefix=/usr --disable-static --enable-thread-safe-observer-pattern CXXFLAGS=-O3 \
    && make -j 4 && make check && make install \
    && cd .. && rm -rf QuantLib-${quantlib_version} && ldconfig

CMD bash
