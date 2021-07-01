# FRP 二合一版


```
docker run -d \
  --name=frp \
  -e PUID=1026 \
  -e PGID=100 \
  -e TZ=Asia/Shanghai \
  # 通过ENV判断frpc、frps
  -e FRP=frpc \
  -p 6800:6800
  -v $PWD/config:/config \
  --restart unless-stopped \
  superng6/frp
```

```yaml
version: "3"

services:
  aria2:
    image: superng6/frp
    container_name: frp
    environment:
      - PUID=1026
      - PGID=100
      - TZ=Asia/Shanghai
      # 通过ENV判断frpc、frps
      - FRP=frpc
    volumes:
      - $PWD/config:/config
    ports:
      - 6800:6800
    restart: unless-stopped   
```