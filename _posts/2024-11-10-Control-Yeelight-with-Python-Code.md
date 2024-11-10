---
layout: post
title:  "Control Yeelight with Python Code"
date:   2024-11-10 22:59:19
author: BenzeneKim
categories: IoT
tags: IoT
cover:  "/assets/instacode.png"
---

# Environment setup
```terminal
python -m venv .venv
.venv/Scripts/activate
pip install yeelight
```
# Find Bulbs
```python
>>> from yeelight import discover_bulbs
>>> discover_bulbs()
```
By using SSDP(Simple Service Discovery Protocol), it discover light bulbs connected on a local network.

## Code Analysis
```python
def discover_bulbs(timeout=2, interface=False):
    s = send_discovery_packet(timeout, interface)

    bulbs = []
    bulb_ips = set()
    while True:
        try:
            data, addr = s.recvfrom(65507)
        except socket.timeout:
            break

        capabilities = parse_capabilities(data)
        parsed_url = urlparse(capabilities["Location"])

        bulb_ip = (parsed_url.hostname, parsed_url.port)
        if bulb_ip in bulb_ips:
            continue

        capabilities = filter_lower_case_keys(capabilities)
        bulbs.append(
            {"ip": bulb_ip[0], "port": bulb_ip[1], "capabilities": capabilities}
        )
        bulb_ips.add(bulb_ip)

    return bulbs
```

Code of discovering light bulbs using SSDP
```python 


def send_discovery_packet(timeout=2, interface=False, ip_address="239.255.255.250"):
    msg = "\r\n".join(
        [
            "M-SEARCH * HTTP/1.1",
            "HOST: " + ip_address + ":1982",
            'MAN: "ssdp:discover"',
            "ST: wifi_bulb",
        ]
    )

    # Set up the UDP socket.
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
    s.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, 32)
    if interface:
        s.setsockopt(
            socket.IPPROTO_IP,
            socket.IP_MULTICAST_IF,
            socket.inet_aton(get_ip_address(interface)),
        )
    s.settimeout(timeout)
    s.sendto(msg.encode(), (ip_address, 1982))

    return s
```


## About SSDP

SSDP (Simple Service Discovery Protocol) is a network protocol that allows devices to discover each other on a local network. It’s commonly used by IoT devices like smart bulbs, media players, and printers to broadcast their presence and find other compatible devices without manual configuration. SSDP is part of the UPnP (Universal Plug and Play) suite, which was developed to simplify device communication within the same network.

# Control Bulbs
## Basic Command
```python
>>> from yeelight import Bulb
>>> bulb = Bulb("192.168.0.19")

# Turn the bulb on.
>>> bulb.turn_on()

# Turn the bulb off.
>>> bulb.turn_off()

# Toggle power.
>>> bulb.toggle()

# Set brightness to 50%.
>>> bulb.set_brightness(50)

# Set brightness of the background light to 50%, if your
# light supports it.
>>> from yeelight import LightType
>>> bulb.set_brightness(50, light_type=LightType.Ambient)

# Set RGB value.
>>> bulb.set_rgb(255, 0, 0)

# Set HSV value.
>>> bulb.set_hsv(320, 100, 50)

# Set hue and saturation, but keep value (brightness) the same.
>>> bulb.set_hsv(320, 100)

# Set color temperature.
>>> bulb.set_color_temp(4700)

# Save this setting as default.
>>> bulb.set_default()
```

## Effects
```python
>>> bulb = Bulb("192.168.0.19", effect="smooth", duration=1000)

# This will turn the bulb on gradually within one second:
>>> bulb.turn_on()

# This will turn the bulb on immediately:
>>> bulb.turn_on(effect="sudden")

# You can easily change the default effect, too:
>>> bulb.effect = "sudden"

# This will turn the bulb off immediately:
>>> bulb.turn_off()
```