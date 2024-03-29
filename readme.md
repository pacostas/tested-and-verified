## Tested and verified

This repo has a set of tools:

- parse the logs
- test the modules listed here: https://access.redhat.com/articles/3376841

## Parse the logs

Put all the logs under the directory `logs` and execute below script

```bash
./get_results.sh -bd ../logs -oss rhel9 --start-date 2024-02-02 --end-date 2024-03-03
```

You will get an output, for the specified range on the specified os. In case there is not `oss` or `start-date`, `end-date` argument, it returns for all the values eg. all operating systems for all the dates that are available on the logs.

## Run tests

- On specific platform (rhel8) for a specific node module (faas) with a specific node version (18)

```bash
    docker build . -f rhel8.dockerfile  --build-arg NPM_MODULE=faas --build-arg NODE_VERSION=18 --build-arg ENABLE_CITGM=false 
```

* On specific platform (rhel8) for all node modules with a specific node version (20)

```bash
./run_all.sh -oss rhel8 -nvs "20"
```

* On a specific pltaform (rhel8) for all node modules with all node versions

```bash
./run_all.sh -oss rhel8
```

* On specific platform (rhel8) for all node modules with a specific node version (20), with citgm enabled

## Questions

- What is the difference between this image `registry.access.redhat.com/ubi8/nodejs-20` and this image `registry.access.redhat.com/ubi8/s2i-core:1`
