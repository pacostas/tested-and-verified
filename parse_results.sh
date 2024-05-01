#!/bin/bash

function main {

    while [[ "${#}" != 0 ]]; do
        case "${1}" in
        --operating-system | -os)
            os="${2}"
            shift 2
            ;;

        --base-directory | -bd)
            base_directory="${2}"
            shift 2
            ;;

        --exclude-directory | -ed)
            exclude_directory="${2}"
            shift 2
            ;;

        --start-date | -sd)
            start_date="${2}"
            shift 2
            ;;
        --end-date | -ed)
            end_date="${2}"
            shift 2
            ;;

        --specific-date | -spd)
            specific_date="${2}"
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

    if [[ -z "${base_directory:-}" ]]; then
        base_directory="./logs"
    fi

    if [[ -n "${specific_date}" ]]; then
        start_date="${specific_date}"
        end_date="${specific_date}"
    fi

    parse_data "${base_directory}" "${exclude_directory}" "${os}" "${start_date}" "${end_date}"
}

function usage() {
    cat <<-USAGE
parse_results.sh --base-directory <path to log files> [OPTIONS]

OPTIONS
  --help                                -h                  prints the command usage
  --base-directory      <path-to-logs>  -bd <path-to-logs>  specifies path to the directory that the logs are located
  --exclude-directory   <path-to-dir>   -ed <path-to-dir>   specifies the directory to exclude from the search
  --operating-system    <os>            -os <os>            specifies the operating system to search for logs
  --start-date          <date>          -sd <date>          specifies the date until to search the logs e.g. 2024-02-09 defaults to 0
  --end-date            <date>          -ed <date>          specifies the date after to search the logs e.g. 2024-02-09 defaults to 9999-12-31
  --specific-date       <date>          -spd <date>         specifies the date to search the logs e.g. 2024-02-09
USAGE
}

function print::error() {
    local message red reset
    message="${1}"
    red="\033[0;31m"
    reset="\033[0;39m"

    echo -e "${red}${message}${reset}" >&2
    exit 1
}

function parse_data() {

    local base_directory exclude_directory os

    base_directory="${1}"
    exclude_directory="${2}"
    os="${3}"
    os_version=""
    start_date="${4}"
    end_date="${5}"

    if [[ -z "$start_date" ]]; then
        start_date="0"
    fi

    if [[ -z "$end_date" ]]; then
        end_date="9999-12-31"
    fi

    if [[ ${os} == "rhel9" ]]; then
        os_version="ubi9"
    elif [[ ${os} == "rhel8" ]]; then
        os_version="ubi8"
    elif [[ ${os} == "rhel7" ]]; then
        os_version="rhel7"
    else
        echo "Invalid operating system"
        exit 1
    fi

    # Iterate through each subdirectory
    for directory in "$base_directory"/*; do
        # check if the date is within the range
        if [[ "$(basename "$directory")" < "$start_date" || "$(basename "$directory")" > "$end_date" ]]; then
            continue
        fi

        # Check if the item is a directory, if the directory should be excluded and if the directory is empty
        if [[ -d "$directory" && "$directory" != "$exclude_directory" && -n "$(ls -A "$directory")" ]]; then

            # List all files in the current directory
            for file in "$directory"/*; do
                if [[ "$(basename "$file")" == "$os"* ]]; then

                    # Store the result of the grep command in a variable
                    result=$(cat $file | grep -zoP "\n=[=]+\nTests[a-zA-Z 0-9]+/nodejs-[0-9]+.+\n=[=]+\nTest.+\n\n( \[(PASSED|FAILED)\] for \'clients\' [a-z_]+ \([0-9:]+\)\n)+")
                    echo -n -e "date \t$(basename "$directory")\t"
                    echo $result | grep -oP '(?<=Tests were run for image '"$os_version"'/)\S+|PASSED|FAILED' | go run ./main.go
                    echo ""
                fi
            done
        fi
    done
}

main "${@:-}"
