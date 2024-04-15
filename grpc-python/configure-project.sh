CLEAR_LINE="\\033[K"

# Check if python is installed
echo -ne "\\r- Verificar la instalación de Python [ ]$CLEAR_LINE\\n"
which python3 2>&1 >/dev/null
if ! [ $? -eq 0 ]; then
    sudo apt-get install python3 python3-venv
fi
echo -ne "\\r\\033[1A- Verificar la instalación de Python [✔]$CLEAR_LINE\\n"

# Check python environment
echo -ne "\\r- Verificar el entorno virtual [ ]$CLEAR_LINE\\n"
if ! test -d venv; then
    python3 -mvenv venv
fi
echo -ne "\\r\\033[1A- Verificar el entorno virtual [✔]$CLEAR_LINE\\n"

# Activate virtual environment
source venv/bin/activate

# install grpc packages
echo -ne "\\r- Instalar los paquetes de GRPC [ ]$CLEAR_LINE\\n"
python -m pip install grpcio grpcio-tools 2>&1 >/dev/null
echo -ne "\\r\\033[1A- Instalar los paquetes de GRPC [✔]$CLEAR_LINE\\n"

echo -ne "\\r- Crear archivos stub [ ]$CLEAR_LINE\\n"
python3 -m grpc_tools.protoc \
    -Iprotos \
    --python_out=python/helloworld \
    --pyi_out=python/helloworld \
    --grpc_python_out=python/helloworld \
    protos/helloworld.proto
echo -ne "\\r\\033[1A- Crear archivos stub [✔]$CLEAR_LINE\\n"

echo "** IMPORTANTE ** : Recuerda activar el entorno virutal antes de comenzar"
echo "                   - source venv/bin/activate"