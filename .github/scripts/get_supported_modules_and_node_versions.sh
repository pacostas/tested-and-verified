#!/bin/bash

node_module=$1
node_versions=$2
oss=$3
repeat_n_times=$4

# Fetch the supported modules in case of all input
if [[ $node_module == "all" ]]; then
  node_modules=$(jq -r 'keys | .' ./supported_modules.json | tr -d '[]" ' | tr ',' ' ')
else
  node_modules=$node_module
fi

nums=$(seq 1 $repeat_n_times)
for num in $nums; do
  for module in $node_modules; do
    for os in $oss; do

      skip_versions=($(jq -r ".$module.skip.$os.node_versions[]?" ./supported_modules.json))

      for node_version in $node_versions; do

        skip=false
        for skip_version in "${skip_versions[@]}"; do
          if [[ "$node_version" == "$skip_version" ]]; then
            skip=true
            break
          fi
        done
        if $skip; then
          continue
        fi

        module_os_node+=("{\"job\": \"${module}_${os}_${node_version}\", \"name\": \"$module\", \"repeat_num\": \"$num\", \"node_version\": \"$node_version\", \"os\": \"$os\"}")
      done
    done
  done
done

json_module_node_version=$(printf '%s\n' "${module_os_node[@]}" | jq -R . | jq -s . | jq -c .)
echo "module_os_node=$json_module_node_version"
