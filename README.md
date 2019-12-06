# docker-usbreset

Reset usb device via Docker

Tested in Raspberry Pi 3 

## Usage

```
docker run -v /dev/bus/usb/001/013:/dev/bus/usb/001/013 --privileged rugarci/usbreset /dev/bus/usb/001/013
```

Also works with device names (/dev/ttyUSB0) or symbolic links (/dev/XBee)

```
docker run -v /dev:/dev --privileged rugarci/usbreset /dev/XBee
```

For Docker compose

```
  usbreset-xbee:
    image: rugarci/usbreset
    command: /dev/XBee
    volumes:
      - "/dev:/dev"
    privileged: true
```


