#!/bin/bash
# Download and install mitmproxy certificate
firefox http://mitm.it &

# Prompt user for certificate location
read -p "Enter path to downloaded certificate (e.g., ~/Downloads/mitmproxy-ca-cert.pem): " CERT_PATH
if [ -f "$CERT_PATH" ]; then
    echo "Converting certificate to .crt format..."
    openssl x509 -in "$CERT_PATH" -out ~/Downloads/mitmproxy-ca-cert.crt
    echo "Certificate successfully converted. Follow browser instructions to complete installation."
else
    echo "Certificate not found. Please download the certificate and try again."
fi
