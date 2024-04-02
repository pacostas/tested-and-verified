## Tested and verified

This repo has a set of tools:

- for parsing the logs
- test any module on rhel7, rhel8, rhel9, ubuntu20 and ubuntu22

## Modules & node versions we support

- The modules we support are listed here: https://access.redhat.com/articles/3348731 on the nodejs section.

## Parse the logs

Put all the logs under the directory `logs` and execute below script

```bash
./get_results.sh -bd ../logs -oss rhel9 --start-date 2024-02-02 --end-date 2024-03-03
```

You will get an output, for the specified range on the specified os. In case there is not `oss` or `start-date`, `end-date` argument, it returns for all the values eg. all operating systems for all the dates that are available on the logs.

## Run tests locally

- On specific platform (rhel8) for a specific node module (faas) with a specific node version (18)

```bash
    docker build . -f rhel8.dockerfile  --build-arg NPM_MODULE=faas-js-rutime --build-arg NODE_VERSION=18 --build-arg ENABLE_CITGM=false
```

- On specific platform (rhel8) for all node modules with a specific node version (20)

```bash
./run_all.sh -oss rhel8 -nvs "20"
```

- On a specific pltaform (rhel8) for all node modules with all node versions

```bash
./run_all.sh -oss rhel8
```

- On specific platform (rhel8) for all node modules with a specific node version (20), with citgm

```bash
./run_all.sh -oss rhel8 -nvs "20" --citgm true
```

## Run tests with github workflow

* Visit the actions page of this repo and for the job, "test all modules", specify the arguments for the packages and the node versions you would like to run the tests against.
