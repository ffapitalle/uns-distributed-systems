#!/bin/bash

echo -ne "\\r- Crear archivos stub [ ]$CLEAR_LINE\\n"
python3 -m grpc_tools.protoc \
    -Iprotos \
    --python_out=python/helloworld \
    --pyi_out=python/helloworld \
    --grpc_python_out=python/helloworld \
    protos/helloworld.proto
echo -ne "\\r\\033[1A- Crear archivos stub [✔]$CLEAR_LINE\\n"
