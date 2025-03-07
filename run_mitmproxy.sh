#!/bin/bash
# Run mitmproxy via Docker
sudo docker run --rm -it \
-v ~/.mitmproxy:/home/mitmproxy/.mitmproxy \
-p 8080:8080 mitmproxy/mitmproxy
