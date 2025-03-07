# Network traffic analysis via Wireshark and mitmproxy Homelab

## Overview
Through this project I processed the capturing of encrypted HTTPS traffic using Wireshark, installing and configuring `mitmproxy` to intercept and analyze encrypted data, and modifying intercepted requests for educational purposes.

## Goals
By the end of this project, you will be able to:
- Analyze network traffic using Wireshark.
- Install and configure `mitmproxy` on your virtual machine.
- Analyze network traffic using `mitmproxy`.
- Modify intercepted network requests to observe dynamic changes.

## Tools & Resources
- [HTTP Response Status Codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)
- [mitmproxy Tutorial](https://docs.mitmproxy.org/stable/)
- [Docker Install Guide](https://hub.docker.com/r/mitmproxy/mitmproxy)

## Project Breakdown

### 1. Analyze Network Traffic with Wireshark
1. Start Wireshark and visit any encrypted website.
2. If using an Azure VM, run the following command in your terminal:

```bash
sudo wireshark
```

3. Select the network interface `eth0`.
4. Observe the captured packets and analyze the available information.

### 2. Analyze Network Traffic with `mitmproxy`

#### Step 1: Install `mitmproxy`
1. Ensure Docker is installed. If not, run:

```bash
sudo apt install docker.io
```

2. Run the following command to install and launch `mitmproxy`:

```bash
sudo docker run --rm -it -v ~/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 mitmproxy/mitmproxy
```

3. `mitmproxy` should now be running.

#### Step 2: Configure Network Settings
1. Open Firefox by running:

```bash
firefox
```

2. Click the hamburger icon (☰) in the top-right corner and navigate to **Settings**.
3. Scroll down to the **Network Settings** section and configure Firefox to allow a proxy.
4. In Firefox, visit `http://mitm.it` and download the certificate for "Linux," "Firefox," or "Other" (in order of preference).
5. Follow the instructions on the page to complete installation, ensuring you convert the `.pem` file to a `.crt` file for proper certificate installation.

#### Step 2: Start Analyzing with `mitmproxy`
1. With `mitmproxy` running, revisit the encrypted website you tested earlier (e.g., `https://www.codepath.org/`).
2. Observe the logged requests in `mitmproxy`, similar to the captured packets in Wireshark.
3. Select a request to view detailed data. Compare the level of detail offered by `mitmproxy` versus Wireshark.

### Exercise 3: Modify Requests with `mitmproxy`
1. Start `mitmproxy` by running:

```bash
sudo docker run --rm -it -v ~/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 mitmproxy/mitmproxy
```

2. Press `i` to open `mitmproxy`'s command prompt, then type:

```bash
~u /Dunedin & ~q
```

3. Open another terminal and run:

```bash
curl --proxy http://127.0.0.1:8080 "http://wttr.in/Dunedin?0"
```

4. Return to the `mitmproxy` terminal to observe the intercepted `GET` request.
5. Press `Enter` to open the request details.
6. Press `e` to edit the request, then select `path` using the arrow keys and press `Enter`.
7. Modify `Dunedin` to `Innsbruck`, then press `Esc` to confirm the change.
8. Press `q` to return to the request details, then press `a` to resume the intercepted request.
9. Observe that the updated URL should now request the weather report for Innsbruck instead of Dunedin.
