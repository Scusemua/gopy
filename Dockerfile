FROM golang:onbuild

RUN apt-get update && apt-get install -y pkg-config python3.9-dev python3-pip && apt-get clean
RUN python3 -m pip install pybindgen
RUN cd /go/src/app && go build -o /go/bin/goimports golang.org/x/tools/cmd/goimports
CMD /go/bin/gopy