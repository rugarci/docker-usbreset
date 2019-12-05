FROM balenalib/armv7hf-alpine-node

RUN apk --update --upgrade add gcc libc-dev libusb-dev linux-headers

COPY usbreset.c .
RUN cc usbreset.c -o usbreset
RUN chmod +x usbreset

RUN apk del gcc libc-dev libusb-dev linux-headers

#Bus 001 Device 013: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port
# ./usbreset /dev/bus/usb/001/013

ENTRYPOINT ["./usbreset"]

