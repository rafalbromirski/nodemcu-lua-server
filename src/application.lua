local net = require("net")
local wifi = require("wifi")

local config = require("config")

local module = {}

local homepage = [[
  <!DOCTYPE HTML>
  <html>
    <head>
      <meta content="text/html; charset=utf-8">
      <title>ESP8266</title>
      <style type="text/css">
        html, body {
          min-height: 100%;
        }
        body {
          font-family: monospace;
          background: url(http://i.imgur.com/rqJrop4.gif) no-repeat 0 0 #5656fa;
          background-size: cover;
          margin: 0;
          padding: 10px;
          text-align: center;
          color: #56f2ff;
        }
      </style>
    </head>
    <body>
      NodeMCU Server
    </body>
  </html>
]]

local function runServer()
  local s = net.createServer(net.TCP)

  print("====================================")
  print("Server Started")
  print("Open " .. wifi.sta.getip() .. " in your browser")
  print("====================================")

  s:listen(config.PORT, function(connection)
    connection:on("receive", function(c, request)
      print(request)
      c:send(homepage)
    end)

    connection:on("sent", function(c) c:close() end)
  end)
end

function module.start()
  runServer()
end

return module
