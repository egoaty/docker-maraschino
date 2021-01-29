# docker-maraschino
Maraschino HTPC interface

## Environment Variables:
* PUID ... unprivileged UID
* PGID ... unprivileged GID
* WEBROOT ... URL path for application root (e.g. /maraschino)

Example docker-compose:

```
version: "2.1"
services:
  maraschino:
    image: egoaty/maraschino
    container_name: maraschino
    environment:
      - PUID=1003
      - PGID=1003
      - WEBROOT=/maraschino
    volumes:
      - /path/to/config:/config
    ports:
      - 7000:7000
    restart: unless-stopped
```
