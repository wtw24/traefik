
## Create networks that will be used by Traefik:

~~~shell
docker network create proxy
~~~

## HTTPS (SSL) on localhost

- https://github.com/FiloSottile/mkcert

### Installation

~~~shell
# First install certutil
sudo apt install libnss3-tools
sudo apt install mkcert

# Install the local CA in the system trust store
mkcert -install

# Print the CA certificate and key storage location
mkcert -CAROOT
~~~

### Generate certificate for domain `app.localhost`, `app.loc` and their subdomains

~~~
mkcert -cert-file certs/local-cert.pem -key-file certs/local-key.pem "app.localhost" "*.app.localhost" "app.loc" "*.app.loc"
~~~

### Start "whoami" example

~~~shell
sudo nano /etc/hosts
~~~
~~~
127.0.0.1       app.loc
127.0.0.1       whoami.app.loc
~~~

~~~
docker-compose -f whoami.yml up
~~~

- https://whoami.app.loc/