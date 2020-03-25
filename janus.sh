cd ~
git clone https://github.com/IlyasOUMNIH/janus_gateway_v091.git
cd janus_gateway_v091
sh autogen.sh
./configure --prefix=/opt/janus --disable-rabbitmq --disable-mqtt --enable-docs
make
make install
make configs
