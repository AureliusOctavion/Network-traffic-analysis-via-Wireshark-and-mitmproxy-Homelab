#!/bin/bash
# Perform test request with mitmproxy
curl --proxy http://127.0.0.1:8080 "http://wttr.in/Dunedin?0"
