## srv-nginx_proxy

## Description

Simple nginx ssl proxy docker image mainly use to protect http request using ssl.

## Prerequisites

- None

## Usage

### simple container

start the a container following [nginx docker image documentation](https://hub.docker.com/_/nginx).
See below an example of nginx container start :
```
docker run --name some-nginx -d -p 8080:80 some-content-nginx
```

### docker-compose

See below an example of docker-compose usage for this image :
```
  jenkins_proxy:
    image: tinycompany/nginx:latest
    container_name: jenkins_proxy
    networks:
      - jenkins_network
    volumes:
      - /srv/nginx/conf.d:/etc/nginx/conf.d
      - /srv/nginx/nginx.conf:/etc/nginx/nginx.conf
    ports:
      - 80:80
      - 443:443
    depends_on:
      - jenkins_web
```

### advanced nginx configuration

- to use specific/advanced configuration (configure through nginx.conf), you can use [nginx configuration ansible's role](https://github.com/tiny-company/asbl-nginx_configuration).

- or simply mount your custom nginx.conf file as a volume :
```
$ docker run --name my-custom-nginx-container -v /host/path/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx
```
See more at [nginx docker image documentation "customize configuration" part](https://hub.docker.com/_/nginx/#customize-configuration)

## Sources

- [server fault topic about installing nginx module in docker container](https://serverfault.com/questions/1152044/how-to-enable-nginx-modules-in-docker-image)
- [install nginx module documentation](https://nginx.org/en/docs/njs/install.html)
- [Compiling Third-Party Dynamic Modules for NGINX](https://www.nginx.com/blog/compiling-dynamic-modules-nginx-plus/)
- [nginx dockerfile example](https://github.com/docker/awesome-compose/blob/master/nginx-wsgi-flask/nginx/Dockerfile)
- [nginx image official dockerhub](https://hub.docker.com/_/nginx)
- [nginx unprivileged image official dockerhub](https://hub.docker.com/r/nginxinc/nginx-unprivileged)
- [fix right issue on unprivileged nginx image](https://stackoverflow.com/questions/70446840/issue-nginx-emerg-mkdir-var-cache-nginx-client-temp-failed-13-permiss)

