# lighty-micro
lighty as a microservice
An updated take on my lighttpd stack as a microservice.

The directory structure is /var/www/sites/[fqdn]/root/[index.php]

In this example I mapped mysql so it could access it on my host machine. I used the host network option because my app needs access to resources behind a VPN. You can link in a mysqld container as per usual.

docker run -v /var/www/sites:/var/www/sites -v /var/run/mysqld:/var/run/mysqld --net=host lighty-micro
