# docker-usbreset

[![Docker Pulls](https://img.shields.io/docker/pulls/rugarci/usbreset.svg)](https://hub.docker.com/r/rugarci/usbreset/) 

Reset USB device via Docker

Tested on Raspberry Pi 3 

## Usage

```bash
docker run -v /dev/bus/usb/001/013:/dev/bus/usb/001/013 --privileged rugarci/usbreset /dev/bus/usb/001/013
```

Also works with device names (/dev/ttyUSB0) or symbolic links (/dev/XBee)

```bash
docker run -v /dev:/dev --privileged rugarci/usbreset /dev/XBee
```

For Docker compose

```yaml
  usbreset-xbee:
    image: rugarci/usbreset
    command: /dev/XBee
    volumes:
      - "/dev:/dev"
    privileged: true
```


