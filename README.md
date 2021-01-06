# docker-ncdc
```
docker build repo for ncdc
```

## Build
```
docker build -t ncdc .
```

## Run
You will need to manually forward port 4242 to the docker host.

```
docker run -it -p 4242:4242 --name ncdc ncdc
```

if you want to run with a persistent store and mount a ro share
directory you can use

```
./run.sh $share_dir $ncdc_dir
```

in this case `$share_dir` will be mounted as `/mnt/share` so you can add files to
your share with something like the following

```
/share film /mnt/share/film/

```

`$ncdc_dir` will be mounted to `${HOME}/.ncdc` and include all the persistent
storage and setting needed for running the daemon
