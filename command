    {"DHE-RSA-SNOW3G-SHA256", "TLS-DHE-RSA-SNOW3G-SHA256"},
    {"RSA-SNOW3G-SHA256", "TLS-RSA-SNOW3G-SHA256"},
    {"ECDHE-RSA-SNOW3G-SHA256", "TLS-ECDHE-RSA-SNOW3G-SHA256"},


req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes

sudo ./configure OPENSSL_SSL_LIBS="-L/home/pi/libressl-snow3g/ -lssl" OPENSSL_SSL_CFLAGS="-I/home/pi/libressl-snow3g/include/" OPENSSL_CRYPTO_LIBS="-L/home/pi/libressl-snow3g/ -lcrypto" OPENSSL_CRYPTO_CFLAGS="-I/home/pi/libressl-snow3g/include/"
s_client -key key.pem -cert cert.pem -cipher ECDHE-RSA-SNOW3G-SHA -ssl3
