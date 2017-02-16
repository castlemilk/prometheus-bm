#!/bin/sh
SCRIPT_DIR=$(dirname $0)
VERSION=1.5.2
if [ ! -f /opt/prometheus/prometheus ]; then
	wget https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.linux-amd64.tar.gz
	tar xf prometheus-${VERSION}.linux-amd64.tar.gz -C /opt/prometheus/ --strip-components=1
	rm -rf prometheus-${VERSION}.linux-amd64.tar.gz
fi
cp ${SCRIPT_DIR}/prometheus.service /etc/systemd/system/
cp -f ${SCRIPT_DIR}/prometheus.yml /opt/prometheus/
sudo systemctl daemon-reload
sudo systemctl enable prometheus.service

