#/bin/sh

mkdir -p data/conf/conf.d
mkdir -p data/logs
mkdir -p data/html

cp resources/nginx.conf data/conf
cp resources/default.conf data/conf/conf.d
cp resources/index.html data/html
cp resources/50x.html data/html
