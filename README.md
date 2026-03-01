<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![project_license][license-shield]][license-url]
[![Email][email-shield]][email-url]

<br />
<div align="center">
	<a href="https://github.com/Gopmyc/Nexum-networking">
		<img src="logo.png" alt="Logo" width="80" height="80">
	</a>

<h3 align="center">Nexum Networking</h3>
<p align="center">
	A modular networking module for the Nexum Lua framework, designed for secure, flexible, and high-performance client-server communication.
	<br />
		<a href="https://gopmyc.github.io/Nexum/"><strong>Explore the docs »</strong></a>
	<br />
	<br />
		<a href="https://github.com/Gopmyc/Nexum-networking/tree/main/tests">View Demo</a>
	· <a href="https://github.com/Gopmyc/Nexum-networking/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
	· <a href="https://github.com/Gopmyc/Nexum-networking/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
</p>
</div>

---

## About The Project

**Nexum-networking** is a networking module for **Nexum**, providing **client-server communication, message handling, and connection management**. It supports:

* Differentiated **CLIENT/SERVER logic** per script
* Modular **libraries** for codec, events, hooks, and network operations
* Automatic handling of **connect/disconnect/send/receive** flows
* Configuration-driven setup via **YAML files**
* Integration with the Nexum runtime for **dynamic module management**
* Error-safe operation with **optional debug logging**
* Configurable **encryption and compression** of communications, either per connection or via default values defined in the configuration script

This module enables developers to build **reliable, real-time networking systems** for games, applications, or distributed Lua systems.

---

### Architecture Overview

#### Libraries

| Library                  | Role                                    | Client/Server |
| ------------------------ | --------------------------------------- | ------------- |
| **codec.lua**             | Encode/decode messages                  | All           |
| **events.lua**            | Manage events and callbacks             | All           |
| **hooks.lua**             | Custom hooks for networking events      | All           |
| **server/connect.lua**    | Handle server-side connections          | SERVER        |
| **server/disconnect.lua** | Handle server-side disconnections       | SERVER        |
| **server/receive.lua**    | Receive messages on the server          | SERVER        |
| **server/send.lua**       | Send messages from the server           | SERVER        |
| **server/unhandled.lua**  | Catch unhandled server messages         | SERVER        |
| **client/connect.lua**    | Handle client-side connections          | CLIENT        |
| **client/disconnect.lua** | Handle client-side disconnections       | CLIENT        |
| **client/receive.lua**    | Receive messages on the client          | CLIENT        |
| **client/send.lua**       | Send messages from the client           | CLIENT        |

#### Configuration

| File                                  | Description                              |
| ------------------------------------- | ---------------------------------------- |
| `configuration/server/network.yaml`   | Server connection and network settings   |
| `configuration/client/network.yaml`   | Client connection and network settings   |
| `configuration/core/content/enet.yaml`| Defines enet  scripts, environment, and privileges to load within Nexum   |
| `configuration/core/networking.yaml`  | Defines core networking scripts, environment, and privileges to load within Nexum   |

---

### Usage Example

```lua
local Nexum = require("srcs")

if SERVER then
	local tServer	= Nexum:Instanciate("networking", "server")

	for sID, tClient in pairs(tServer.CLIENTS) do
		tServer:SendToClient(sID, tServer:BuildPacket("message-id-test", "Hello friend !", false, true))
	end
elseif CLIENT then
	local tClient	= Nexum:Instanciate("networking", "client")

	tClient:AddHook("message-id-test", function(Data)
		print("Received from server :", Data, type(Data))
		tClient:SendToServer(tClient:BuildPacket("message-id-test", "Hello server friend !", true, true))
	end)
end
````

For more examples, check the [tests folder](https://github.com/Gopmyc/Nexum-networking/tree/main/tests) or the [documentation](https://gopmyc.github.io/Nexum/).

---

### Key Features

* 🔧 Differentiated CLIENT/SERVER logic per script
* 🔧 Modular networking libraries: codec, events, hooks
* 🔧 Automatic connect, disconnect, send, and receive flows
* 🔧 Configuration-driven setup via YAML
* 🔧 Integrated with Nexum runtime for dynamic module instantiation
* 🔧 Optional debug and logging support
* 🔧 Plug-and-play ready for extension

<p align="right"><a href="#readme-top">🔝</a></p>

---

## Getting Started

### Prerequisites

* Lua installed: [https://www.lua.org/download.html](https://www.lua.org/download.html)
* Nexum framework installed

### Installation

```bash
git clone https://github.com/Gopmyc/Nexum-networking.git
cd Nexum-networking
```

Include the module in your Nexum project:

```lua
local Nexum         = require("srcs")

local sInstanceId   = "networking"
local sInstanceName = SERVER and "SUPER-SERVER" or "SUPER-CLIENT"
local tInstance     = Nexum:Instanciate(sInstanceId, sInstanceName)
```

---

### Roadmap

* [x] Client/server separation for networking logic
* [x] Modular libraries for message handling, hooks, and codec
* [x] YAML-based configuration
* [x] Configurable encryption and compression per connection or via default values
* [ ] Add automated testing examples

---

### Contributing

Contributions are welcome! Follow conventional commits.

1. Fork the repo
2. Create a branch (`git checkout -b feature/MyFeature`)
3. Commit (`git commit -m 'feat: add MyFeature'`)
4. Push (`git push origin feature/MyFeature`)
5. Open a Pull Request

---

### License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for details.

---

### Contact

**Gopmyc**
📧 [gopmyc.pro@gmail.com](mailto:gopmyc.pro@gmail.com)
🔗 [GitHub](https://github.com/Gopmyc/Nexum-networking)

---

[contributors-shield]: https://img.shields.io/github/contributors/Gopmyc/Nexum-networking.svg?style=for-the-badge
[contributors-url]: https://github.com/Gopmyc/Nexum-networking/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Gopmyc/Nexum-networking.svg?style=for-the-badge
[forks-url]: https://github.com/Gopmyc/Nexum-networking/network/members
[stars-shield]: https://img.shields.io/github/stars/Gopmyc/Nexum-networking.svg?style=for-the-badge
[stars-url]: https://github.com/Gopmyc/Nexum-networking/stargazers
[issues-shield]: https://img.shields.io/github/issues/Gopmyc/Nexum-networking.svg?style=for-the-badge
[issues-url]: https://github.com/Gopmyc/Nexum-networking/issues
[license-shield]: https://img.shields.io/github/license/Gopmyc/Nexum-networking.svg?style=for-the-badge
[license-url]: https://github.com/Gopmyc/Nexum-networking/blob/main/LICENSE
[email-shield]: https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white
[email-url]: mailto:gopmyc.pro@gmail.com