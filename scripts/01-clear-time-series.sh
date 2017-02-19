#!/bin/sh
HOST=localhost
PORT=9094
curl -XDELETE -g "http://${HOST}:${PORT}/api/v1/series?match[]=up&match[]=$1"
