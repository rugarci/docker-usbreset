FROM alpine:3

RUN apk --update --upgrade add gcc libc-dev libusb-dev linux-headers

COPY usbreset.c .
COPY reset.sh .
COPY run.sh .
RUN chmod +x reset.sh
RUN chmod +x run.sh

RUN cc usbreset.c -o usbreset
RUN chmod +x usbreset

RUN apk del gcc libc-dev libusb-dev linux-headers

ENTRYPOINT ["./run.sh"]