FROM mikemanger/python27-mysql

# [for gfw](https://github.com/xsthunder/docker/blob/main/ubuntu-common/Dockerfile)
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update

# [Make sure netcat is installed in your Dockerfile before running the command.](https://github.com/Eficode/wait-for)
RUN apt-get -q update && apt-get -qy install netcat


VOLUME /tool
VOLUME /data

WORKDIR /tool

WORKDIR /

COPY ./load-data.sh ./

COPY ./wait-for ./

# 没有bash!只有sh
# keep container running see [Keep a container running in compose · Issue #1926 · docker/compose](https://github.com/docker/compose/issues/1926)
CMD tail -f /dev/null
# CMD sh /load-data.sh && tail -f /dev/null
