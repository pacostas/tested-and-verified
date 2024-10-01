#!/bin/bash

node_module=$1
node_versions=$2
os=$3
repeat_n_times=$4

# Fetch the supported modules in case of all input
if [[ $node_module == "all" ]]; then
  node_modules=$(jq -r 'keys | .' ./supported_modules.json | tr -d '[]" ' | tr ',' ' ')
else
  node_modules=$node_module
fi

for num in $(seq 1 $repeat_n_times); do
  for module in $node_modules; do

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

      module_node_versions+=("{\"job\": \"${module}_${node_version}\", \"name\": \"$module\",  \"repeat_num\": \"$num\", \"node_version\": \"$node_version\"}")
    done
  done
done

json_module_node_version=$(printf '%s\n' "${module_node_versions[@]}" | jq -R . | jq -s . | jq -c .)
echo "module_node_version=$json_module_node_version"
