FROM  ubuntu:18.04

# Copy installation scripts in
COPY *.sh ./

RUN apt-get update
RUN apt-get install -y libconfig-dev ffmpeg net-tools curl gtk-doc-tools

# Prepare the system
RUN ./setup.sh
# Install dependencies
RUN ./dependencies.sh
# Install extras
RUN ./extras.sh
# Install libnice (The version out of the box in Ubuntu is known to cause problems)
RUN ./libnice.sh
# Install libsrtp 2.0.0 (To reduce risk of broken interoperability with future WebRTC versions)
RUN ./libsrtp.sh
# Install usrsctp for data channel support
RUN ./usrsctp.sh
# Install websocket dependencies
RUN ./websockets.sh

# Copy the apache configuration files ready for when we need them
COPY apache2/*.conf ./
# Install and prepare apache
RUN ./apache.sh

# Clone, build and install the gateway
RUN ./janus.sh

# Declare the ports we use
EXPOSE 80 7088 8088 8188 8004 8004/udp

# Define the default start-up command
CMD ./startup.sh
