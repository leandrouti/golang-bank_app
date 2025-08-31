
## Install

### 1. Set file permissions

1. Get the User Id / Group Id (Ex. id command in linux)
2. create a .env file and fill: 

.env
```
UID=(value of uid)
GID=(value of gid)
```

### 2. Build the container
```
docker compose build
```


## Developing

### Starting all the containers

```
docker compose up -d
```

### Using the containers

Start Shell inside app container
```
docker compose exec -it app bash
```

