FROM scaleway/debian:amd64-jessie
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM scaleway/debian:armhf-jessie       # arch=armv7l
#FROM scaleway/debian:arm64-jessie       # arch=arm64
#FROM scaleway/debian:i386-jessie        # arch=i386
#FROM scaleway/debian:mips-jessie        # arch=mips

# Prepare rootfs
RUN /usr/local/sbin/scw-builder-enter

# Add your commands here (before scw-builder-leave and after scw-builder-enter)

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections
RUN apt-get update
RUN apt-get -y -q install ca-certificates dialog git
RUN git clone https://github.com/YunoHost/install_script /tmp/install_script 
RUN cd /tmp/install_script && chmod +x ./install_yunohost && ./install_yunohost -a

COPY ./overlay/ /

# Clean rootfs
RUN /usr/local/sbin/scw-builder-leave
