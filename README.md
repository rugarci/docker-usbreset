# docker-usbreset

Reset usb device via Docker

## Usage

```
docker run -v /dev/bus/usb/001/013:/dev/bus/usb/001/013 --privileged rugarci/usbreset /dev/bus/usb/001/013
```
