FROM golang:bullseye

RUN apt-get update 

RUN apt-get install -y pkg-config build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

RUN wget https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz && tar -xvf Python-3.11.9.tgz
# RUN wget https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz && tar -xvf Python-3.11.6.tgz

RUN mkdir Python-3.11.9/debug

# RUN cd Python-3.11.6 && ./configure --prefix=/usr/local --enable-optimizations --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" && make -j8 && make -j8 altinstall
RUN cd Python-3.11.9/debug && ../configure --enable-optimizations --enable-shared --prefix=/usr --with-pydebug && make -j8 EXTRA_CFLAGS="-DPy_REF_DEBUG" && make -j8 altinstall

RUN cp /go/Python-3.11.9/debug/libpython3.11d.so /usr/lib/x86_64-linux-gnu/libpython3.11d.so
RUN cp /go/Python-3.11.9/debug/libpython3.11d.so.1.0 /usr/lib/x86_64-linux-gnu/libpython3.11d.so.1.0

RUN apt-get clean
# RUN apt-get update && apt-get install -y pkg-config python3-dev python3-pip && apt-get clean
# RUN echo "/usr/local/lib >> /etc/ld.so.conf && ldconfig"

RUN go install -a -v -gcflags "-N -l" std

RUN python3.11 -m pip install pybindgen

RUN go install golang.org/x/tools/cmd/goimports@latest

ENV LD_LIBRARY_PATH=/go/Python-3.11.9/debug

CMD /go/bin/gopy
