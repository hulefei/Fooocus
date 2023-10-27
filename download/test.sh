#!/bin/sh

# 在这里放置你想在容器启动时执行的代码
echo "Hello, World!"

echo "Downloading, this might take a while..."
aria2c -x 10 --disable-ipv6 --input-file /download/links.txt --dir /models --continue

# echo "Checking SHAs..."
# parallel --will-cite -a /docker/checksums.sha256 "echo -n {} | sha256sum -c"