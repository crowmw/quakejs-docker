<div align="center">

![logo](https://github.com/crowmw/quakejs-docker/blob/master/quakejs-docker.png?raw=true)

# quakejs-docker

</div>

### A fully local and Dockerized quakejs server. Independent, unadulterated, and free from the middleman.

The goal of this project was to create a fully independent quakejs server in Docker that does not require content to be served from the internet.
Hence, once pulled, this does not need to connect to any external provider, ie. content.quakejs.com. Nor does this server need to be proxied/served/relayed from quakejs.com

#### Simply pull the image [crowmw/quakejs-docker](https://hub.docker.com/r/crowmw/quakejs-docker)

```
docker pull crowmw/quakejs-docker:latest
```

#### and run it:

```
docker run -d --name quakejs -e HTTP_PORT=<HTTP_PORT> -p <HTTP_PORT>:80 -p 27960:27960 -v /quakejs/config:/config crowmw/quakejs-docker:latest
```

#### Example:

```
docker run -d --name quakejs -e HTTP_PORT=8080 -p 8080:80 -p 27960:27960 -v /quakejs/config:/config crowmw/quakejs-docker:latest
```

Send all you friends/coworkers the link: ex. http://localhost:8080 and start fragging ;)

### Public server

If you want to run public server (eg. from Synology Nas) you need to reversed proxy http://localhost:8080 (eg. https://quake.your-domain.com) and forward port 27960/udp on your router.

#### server.cfg:

Refer to [quake3world](https://www.quake3world.com/q3guide/servers.html) for instructions on its usage.

After first run container copy default config to mapped /config volume.
Then you can change it and it will be used after reboot container.

#### docker-compose.yml

```
version: '2'
services:
    quakejs:
        container_name: quakejs
        environment:
            - HTTP_PORT=8080
        ports:
            - '8080:80'
            - '27960:27960/udp
        image: 'crowmw/quakejs-docker:latest'
        volumes:
            - ./quakejs/config:/config
```

#### Building the Image

Build the image with:

`docker build . -t crowmw/quakejs-docker:latest`

## Credits:

[begleysm](https://github.com/begleysm) - [fork](https://github.com/begleysm/quakejs) [quakejs](https://github.com/inolen/quakejs) to which this was derived, aswell as his thorough [documentation](https://steamforge.net/wiki/index.php/How_to_setup_a_local_QuakeJS_server_under_Debian_9_or_Debian_10)

[treyyoder](https://github.com/treyyoder) - for dockerisation

[realies](https://github.com/realies) - for fix allow using https over reversed proxy
