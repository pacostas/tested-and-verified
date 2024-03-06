## Parse the logs

```bash
./get_results.sh -bd ../logs -os rhel9 --start-date 2024-02-02 --end-date 2024-03-03
```

## Build docker containers

```bash
docker build -t rhel8 . -f rhel8.dockerfile  --build-arg NPM_MODULE=opossum --build-arg ENABLE_CITGM=false --build-arg NODE_VERSION=20
```
