# Local Media Server

Run ARR stack locally

# Configuration

## qbittorrent credentials

Run this command to get 1st run password (chage it later on).

```
$ kubectl -n media logs deploy/qbittorrent | grep -i password   
```

## local kubernetes endpoints

http://prowlarr.media.svc.cluster.local:9696
http://sonarr.media.svc.cluster.local:8989
http://radarr.media.svc.cluster.local:7878
http://qbittorrent.media.svc.cluster.local:8080

# Operation

Use `make` to do usual ops, for help just type make.