# IoT NodeMCU webserver

IoT Webserver for NodeMCU (written in Lua)

## Setup

If you don't have any experience with ESP8266 and Lua, please check: [IoT Esp8266 Lua Guide](https://github.com/WATTx/iot-esp8266-lua-guide)

1. Clone / Download this repository.
2. Install [nodemcu-tool](https://www.npmjs.com/package/nodemcu-tool) using npm:

  ```
  npm install nodemcu-tool -g
  ```

3. Optional: You can install lua linter - `luacheck`:

  ```
  luarocks install luacheck
  ```

## Configuration

Before you start you have to update `config.lua` file and set WiFi credentials:

```lua
module.SSID["NAME"] = "PASSWORD"
```

Connect your NodeMCU to USB port and upload all lua scripts (`/dev/cu.wchusbserial1410` - your device name might be different)

```
$ nodemcu-tool --port /dev/cu.wchusbserial1410 upload src/*.lua
```

If you're done you can try to connect to your NodeMCU:

```
$ nodemcu-tool --port /dev/cu.wchusbserial1410 terminal
```

In order to see NodeMCU / server logs press `RESET` button on the board - the webserver will restart and try to establish wifi connection again:

```
Connecting to YOUR_WIFI_NETWORK...
====================================
ESP8266 mode is: 1
MAC address is: 5e:cf:7f:1b:df:19
IP is 192.168.1.100
====================================
Server Started
Open 192.168.1.100 in your browser
====================================
```

Follow the instruction and open your browser with given IP address:

![NodeMCU WebServer Preview](https://raw.github.com/paranoida/nodemcu-lua-server/master/preview.png)

Happy Hacking.

### Resources:

- [NodeMCU Lua Guide](https://github.com/WATTx/iot-esp8266-lua-guide)
- Code based on this [article](http://www.foobarflies.io/a-simple-connected-object-with-nodemcu-and-mqtt/)

## License

This project is distributed under the MIT license.
