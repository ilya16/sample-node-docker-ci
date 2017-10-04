#!/bin/bash
docker push ib16/sample-node

ssh ilyaborovik97@146.148.121.114 << EOF
docker pull ib16/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi ib16/sample-node:current || true
docker tag ib16/sample-node:latest ib16/sample-node:current
docker run -d --restart always --name web -p 80:80 ib16/sample-node:current
EOF
