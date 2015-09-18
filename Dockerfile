# Requirements:
#   - download latest MarkLogic 8 (MarkLogic-8.0-....x86_64.rpm) from http://developer.marklogic.com/download
#     into the same directory like this Dockerfile
#
# Build your own image:
#     docker build --force-rm=true -t centos-marklogic8.0-3 .
#
# Start a new container with this image:
#     docker run -v /Users/jjoerg/MarkLogic/development/mldemos/wm14plus:/application -p 8000:8000 -p 8001:8001 -p 8002:8002 -p 9060:9060 -p 9061:9061 -p 9062:9062 -p 9063:9063 -p 9064:9064 --name="wm14-demo" centos-marklogic8.0-3
#
# If you are interested to connect into the container:
#     docker exec -i -t wm14-demo bash
#



FROM centos:centos6
MAINTAINER Jochen Joerg <jochen.joerg@marklogic.com>


# Install MarkLogic
WORKDIR /tmp
ADD MarkLogic-8.0-3.x86_64.rpm /tmp/MarkLogic.rpm

RUN yum -y install /tmp/MarkLogic.rpm

ENV MARKLOGIC_INSTALL_DIR /opt/MarkLogic
ENV MARKLOGIC_DATA_DIR /data

ENV MARKLOGIC_FSTYPE ext4
ENV MARKLOGIC_USER daemon
ENV MARKLOGIC_PID_FILE /var/run/MarkLogic.pid
ENV MARKLOGIC_MLCMD_PID_FILE /var/run/mlcmd.pid
ENV MARKLOGIC_UMASK 022

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/MarkLogic/mlcmd/bin
ENV LD_PRELOAD /opt/MarkLogic/lib/libjemalloc.so.1
ENV LD_LIBRARY_PATH /opt/MarkLogic/lib:/data/Lib

# Define mountable directory
VOLUME ["/data"]

# Define working directory
WORKDIR /data

# Define default command (which avoids immediate shutdown)
CMD /opt/MarkLogic/bin/MarkLogic && tail -F /data/Logs/ErrorLog.txt

# Expose MarkLogic Server ports
EXPOSE 8000 8001 8002 9040 9041 9042 9043 9044 9045
