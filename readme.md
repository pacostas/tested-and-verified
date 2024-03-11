## Parse the logs

Put all the logs under the directory `logs` and execute below script

```bash
./get_results.sh -bd ../logs -oss rhel9 --start-date 2024-02-02 --end-date 2024-03-03
```

## Run tests on specific platform for a specific node module on a specific node version

```bash
    docker build -t rhel8 . -f rhel8.dockerfile  --build-arg NPM_MODULE=faas --build-arg ENABLE_CITGM=false --build-arg NODE_VERSION=18
```

## Run all the tests for a specific platform and specific node version

```bash
./run_all.sh -oss rhel8 -nvs "20"
```

## Run all the tests for all platforms on all node version

```bash
./run_all.sh -oss rhel8
```


## Questions

- What is the difference between this image `registry.access.redhat.com/ubi8/nodejs-20` and this image `registry.access.redhat.com/ubi8/s2i-core:1`
