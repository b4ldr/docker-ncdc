# docker-ncdc
```
docker build repo for ncdc
```

## Build
```
docker build -t ncdc .
```

## Run
You will need to manualy forward port 4242 to the docker host

```
docker run -it -p 4242:4242 --name ncdc ncdc
```
