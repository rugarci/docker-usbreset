# docker-usbreset

Reset usb device via Docker

## Usage

```
docker run -v /dev/bus/usb/001/013:/dev/bus/usb/001/013 --privileged rugarci/usbreset /dev/bus/usb/001/013
```

Also works with device names (/dev/ttyUSB0) or symbolic links (/dev/XBee)

```
docker run -v /dev:/dev --privileged rugarci/usbreset /dev/XBee
```
