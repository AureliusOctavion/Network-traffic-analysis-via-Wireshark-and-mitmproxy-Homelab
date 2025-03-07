#!/bin/bash
# Instructions for modifying intercepted requests
echo "Steps to modify intercepted requests in mitmproxy:"
echo "1. Run mitmproxy."
echo "2. Press 'i' to open mitmproxy's command prompt."
echo "3. Type '~u /Dunedin & ~q' and press Enter."
echo "4. In another terminal, run the following command:"
echo '   curl --proxy http://127.0.0.1:8080 "http://wttr.in/Dunedin?0"'
echo "5. In mitmproxy, press Enter to open the intercepted request details."
echo "6. Press 'e' to edit the request."
echo "7. Select 'path' with arrow keys, press Enter, then modify 'Dunedin' to 'Innsbruck'."
echo "8. Press Esc to confirm the change, then press 'a' to resume the request."
