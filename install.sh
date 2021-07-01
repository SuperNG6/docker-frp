#!/usr/bin/env bash

# Check CPU architecture
ARCH=$(uname -m)
VERSION=$(cat ReleaseTag | head -n1)

echo -e "${INFO} Check CPU architecture ..."
if [[ ${ARCH} == "x86_64" ]]; then
    ARCH="amd64"
elif [[ ${ARCH} == "aarch64" ]]; then
    ARCH="arm64"
elif [[ ${ARCH} == "armv7l" ]]; then
    ARCH="arm"
else
    echo -e "${ERROR} This architecture is not supported."
    exit 1
fi

# Download files
echo "Downloading binary file: ${ARCH}"
curl -L "https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_${ARCH}.tar.gz" | tar -xz

if [[ ${FRP} == "FRPC" ]]; then
    FRP="frpc"
elif [[ ${FRP} == "FRPS" ]]; then
    FRP="frps"
fi

mkdir -p /frp

mv frp_${VERSION}_linux_${ARCH}/{frpc.ini,frps.ini,frps,frpc} /frp

echo "Download binary file: ${ARCH} completed"
