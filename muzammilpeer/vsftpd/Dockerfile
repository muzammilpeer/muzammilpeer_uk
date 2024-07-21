FROM fauria/vsftpd

# Copy your SSL certificate and key to the container
COPY vsftpd.pem /etc/ssl/private/vsftpd.pem

# Ensure the vsftpd config file enables SSL, adjust paths as necessary
RUN echo "ssl_enable=YES" >> /etc/vsftpd.conf \
    && echo "allow_anon_ssl=NO" >> /etc/vsftpd.conf \
    && echo "force_local_data_ssl=YES" >> /etc/vsftpd.conf \
    && echo "force_local_logins_ssl=YES" >> /etc/vsftpd.conf \
    && echo "ssl_tlsv1=YES" >> /etc/vsftpd.conf \
    && echo "ssl_sslv2=NO" >> /etc/vsftpd.conf \
    && echo "ssl_sslv3=NO" >> /etc/vsftpd.conf \
    && echo "rsa_cert_file=/etc/ssl/private/vsftpd.pem" >> /etc/vsftpd.conf \
    && echo "rsa_private_key_file=/etc/ssl/private/vsftpd.pem" >> /etc/vsftpd.conf

