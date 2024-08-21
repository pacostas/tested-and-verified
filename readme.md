## Tested and verified

This repo has a set of tools:

- for parsing the logs
- test any module on rhel8, rhel9, fedora, ubuntu20 and ubuntu22 against any supported node version

## Parse the logs

Download the whole logs folder from google drive.

```bash
cd tested_and_verified 
rm -rf ./logs && mkdir ./logs
unzip ~/Downloads/<log-zip-file>.zip  -d ./logs
./parse_results.sh -os rhel9  --start-date 2024-03-13 --end-date 2024-05-01 2>/dev/null 

```
You will get an output, for the specified range on the specified os. In case there is not `oss` or `start-date`, `end-date` argument, it returns for all the values eg. all operating systems for all the dates that are available on the logs.

## Run tests locally

- On specific platform (rhel8) for all node modules with a specific node versions (20 and 18)

```bash
./test.sh -oss rhel8 -nvs "20 18"
```

- On specific platform (rhel8) for all node modules with a specific node version (20), with citgm

```bash
./test.sh -oss rhel8 -nvs "20" --citgm true
```

- On specific platform (rhel8) for all node version with a specific node module (pino)

```bash
./test.sh -oss rhel8 -pckgs pino
```

## Run tests with github workflow

* Visit the actions page of this repo and for the job, "test all modules", specify the arguments for the packages and the node versions you would like to run the tests against.
