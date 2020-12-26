FROM 0x01be/smartsim:build as build

FROM 0x01be/xpra

COPY --from=build /opt/smartsim/ /opt/smartsim/

RUN apk add --no-cache --virtual smartsim-runtime-dependencies \
    glib \
    gtk+3.0 \
    librsvg \
    libxml2 

USER ${USER}
ENV PATH=${PATH}:/opt/smartsim/bin \
    COMMAND=smartsim

