cd ~
git clone https://github.com/IlyasOUMNIH/janus_gateway_v091.git
cd janus_gateway_v091
git checkout bbb68f4ae1b8b1a0f613e03f0aa7194bc24a7a2c
sh autogen.sh
./configure --prefix=/opt/janus --disable-rabbitmq --disable-mqtt
make
make install
make configs
