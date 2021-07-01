FROM lsiobase/alpine:3.13 as builder

WORKDIR /downloads
COPY ReleaseTag  /downloads
COPY install.sh /downloads

# download frp
RUN set -ex \
	&& chmod +x install.sh \
	&& bash install.sh

# install frp
FROM lsiobase/alpine:3.13

# set label
LABEL maintainer="NG6"
ENV TZ=Asia/Shanghai FRP=frpc \
    PUID=1026 PGID=100

# copy local files && frp
COPY root/ /
COPY --from=builder /frp/* /usr/local/bin/

VOLUME /config
