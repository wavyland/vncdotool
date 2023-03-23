FROM python:3.11-slim as build
ENV workdir=/src
RUN mkdir -p $workdir
WORKDIR $workdir
RUN apt-get update
RUN apt-get install -y openssl ca-certificates libffi-dev build-essential libssl-dev git rustc cargo
RUN python3 -m pip install numpy
RUN apt-get remove --purge -y libffi-dev build-essential libssl-dev git rustc cargo
RUN rm -rf /root/.cargo
ADD https://github.com/sibson/vncdotool/archive/8492abf347566c36f67ea368d70ddaabf931719b.tar.gz vncdotool.tar.gz
RUN python3 -m pip install vncdotool.tar.gz

FROM python:3.11-slim

COPY --from=build /lib /lib
COPY --from=build /usr/local /usr/local

USER nobody

ENTRYPOINT ["vncdo"]
