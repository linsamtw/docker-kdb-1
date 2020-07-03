FROM ubuntu:18.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV QHOME /opt/q
ENV PORT 5000
ENV PATH ${PATH}:${QHOME}/l32/
ENV ON_STARTUP=""

RUN apt-get update && apt-get install -y \
    unzip rlwrap lib32z1 lib32ncurses5 lib32stdc++6

COPY linuxx86.zip /
COPY kdb-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/kdb-entrypoint.sh

RUN unzip linuxx86.zip -d /opt/ \
    && chown -R root ${QHOME} \
    && chmod 755 ${QHOME}/l32/q
    
RUN rm linuxx86.zip

WORKDIR /
EXPOSE $PORT
ENTRYPOINT ["kdb-entrypoint.sh"]

