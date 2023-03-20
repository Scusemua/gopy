FROM golang:bullseye

RUN apt-get update && apt-get install -y pkg-config python3.9-dev python3-pip && apt-get clean
RUN python3 -m pip install pybindgen
RUN go install golang.org/x/tools/cmd/goimports@latest
CMD /go/bin/gopy