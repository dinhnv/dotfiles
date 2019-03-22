openssl req -config ssl.conf -new -x509 -sha256 -newkey rsa:2048 -nodes -days 1000 -keyout localhost.key -out localhost.crt
