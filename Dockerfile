FROM 0x01be/base

WORKDIR /smartsim
ENV REVISION=master
RUN apk add --no-cache --virtual smartsim-build-dependencies \
    git \
    build-base \
    pkgconfig \
    glib-dev \
    gtk+3.0-dev \
    librsvg-dev \
    libxml2-dev &&\
    git clone --depth 1 --branch ${REVISION} https://github.com/ashleynewson/SmartSim.git /smartsim &&\
    ./configure --prefix=/opt/smartsim &&\
    make
RUN make install

