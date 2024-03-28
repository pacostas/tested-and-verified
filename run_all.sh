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
        $node_versions="14 16 18 20"
        usage
        echo
        print::error "--node-version"
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
        packages="fastify express prom kube faas cloudevents opossum"
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
                                                                    default values: rhel7, rhel8, rhel9
    --citgm <citgm>                        -c <citgm>               Whether to run with citgm defauts to false
    --node-version <node version>          -nvs <node versions>     The node versions to run the tests on
                                                                    supported values: 14 (on rhel7), 16, 18, 20
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

    for os in $oss; do
        for node_version in $node_versions; do
            for package in $packages; do
                docker build . -f "${os}.dockerfile" --build-arg NPM_MODULE=$package --build-arg ENABLE_CITGM=$citgm --build-arg NODE_VERSION=$node_version
            done
        done
    done
}

main "${@:-}"
