#!/bin/sh

echo "Hello, World!"

 echo "Downloading, this might take a while..."
 aria2c -x 10 --disable-ipv6 --input-file /download/links.txt --dir /models --continue

# echo "Checking SHAs..."
# parallel --will-cite -a /docker/checksums.sha256 "echo -n {} | sha256sum -c"