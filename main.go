package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

type NodeVersion struct {
	version              string
	npm_packages_results []string
}

func main() {

	scanner := bufio.NewScanner(os.Stdin)

	var input string
	var data map[string]NodeVersion
	var currentNodeVersion string
	data = make(map[string]NodeVersion)

	data["nodejs-16"] = NodeVersion{version: "16", npm_packages_results: []string{}}
	data["nodejs-18"] = NodeVersion{version: "18", npm_packages_results: []string{}}
	data["nodejs-20"] = NodeVersion{version: "20", npm_packages_results: []string{}}

	for scanner.Scan() {

		input = scanner.Text()
		if input == "FAILED" || input == "PASSED" {
			nodeVersion := data[currentNodeVersion]
			nodeVersion.npm_packages_results = append(nodeVersion.npm_packages_results, input)
			data[currentNodeVersion] = nodeVersion
		} else {
			currentNodeVersion = strings.Split(input, ":")[0]
		}
	}

	if err := scanner.Err(); err != nil {
		fmt.Fprintln(os.Stderr, "reading standard input:", err)
	}

	for i := 0; i < len(data[currentNodeVersion].npm_packages_results); i++ {
		if len(data["nodejs-16"].npm_packages_results) == 0 {
			fmt.Print("\t")
		} else {
			fmt.Print(data["nodejs-16"].npm_packages_results[i])
			fmt.Print("\t")
		}
		if len(data["nodejs-18"].npm_packages_results) == 0 {
			fmt.Print("\t")
		} else {
			fmt.Print(data["nodejs-18"].npm_packages_results[i])
			fmt.Print("\t")
		}
		if len(data["nodejs-20"].npm_packages_results) == 0 {
			fmt.Print("\t")
		} else {
			fmt.Print(data["nodejs-20"].npm_packages_results[i])
			fmt.Print("\t")
		}
	}

}
