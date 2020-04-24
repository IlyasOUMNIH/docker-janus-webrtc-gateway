apt-get install -y nginx
apt-get install -y libnginx-mod-rtmp
cp ./default /etc/nginx/sites-enabled/default
cp ./janus.js /opt/janus/share/janus/demos/janus.js
echo '
# RTMP Stream
rtmp {
    server {
        listen 1935;
        chunk_size 4000;
        application live {
            live on;
        }
    }
}' >> /etc/nginx/nginx.conf
