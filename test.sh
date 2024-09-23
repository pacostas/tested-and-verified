#! /bin/bash

function main {

    while [[ "${#}" != 0 ]]; do
        case "${1}" in
        --operating-systems | -oss)
            oss="${2}"
            shift 2
            ;;

        --citgm | -c)
            citgm="${2}"
            shift 2
            ;;

        --node-versions | -nvs)
            node_versions="${2}"
            shift 2
            ;;

        --packages | -pckgs)
            packages="${2}"
            shift 2
            ;;

        --help | -h)
            shift 1
            usage
            exit 0
            ;;

        "")
            # skip if the argument is empty
            shift 1
            ;;

        *)
            print::error "unknown argument \"${1}\""
            ;;
        esac
    done

    if [[ -z "$node_versions" ]]; then
        usage
        echo
        print::error "--node-versions"
    fi

    if [[ -z "$oss" ]]; then
        usage
        echo
        print::error "--operating-systems"
    fi


    if [[ -z "$citgm" ]]; then
        citgm="false"
    fi

    if [[ -z "$packages" ]]; then
        packages=$(jq -r 'keys | .' ./supported_modules.json | tr -d '[]" ' | tr ',' ' ')
    fi

    run_tests "$oss" "$citgm" "$node_versions" "$packages"
}

function print::error() {
    local message red reset
    message="${1}"
    red="\033[0;31m"
    reset="\033[0;39m"

    echo -e "${red}${message}${reset}" >&2
    exit 1
}

function usage() {
    cat <<-USAGE
run_all.sh --operating-system <operating system> --node-version <node version> [OPTIONS]

OPTIONS
    --operating-system <operating system>  -oss <operating systems> The operating systems to run the tests on
                                                                    default values: rhel8, rhel9
    --citgm <citgm>                        -c <citgm>               Whether to run with citgm defauts to false
    --node-versions <node version>          -nvs <node versions>     The node versions to run the tests (separated by space).
    --packages <packages>                  -pckgs <packages>        the packages to run the tests on
                                                                    default: fastify, express, prom, kube, faas, cloudevents, opossum
    --help                                 -h                       prints the command usage
USAGE
}

run_tests() {
    local oss="${1}"
    local citgm="${2}"
    local node_versions="${3}"
    local packages="${4}"


## TODO add a skip in case of the vesion is skipped.

    for os in $oss; do
        for node_version in $node_versions; do
            for package in $packages; do
                docker build . -f ./containerfiles/Dockerfile.$os \
                --build-arg NPM_MODULE=$package \
                --build-arg ENABLE_CITGM=$citgm \
                --build-arg NODE_VERSION=$node_version --progress=plain 2>&1 | tee -a build_output.log
            done
        done
    done
}

main "${@:-}"
