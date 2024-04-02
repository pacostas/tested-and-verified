#! /bin/bash

NPM_MODULE=$1
ENABLE_CITGM=$2

if [ "$ENABLE_CITGM" = "true" ]; then
  citgm $NPM_MODULE
else
  response=$(curl -s "https://registry.npmjs.org/${NPM_MODULE}")
  repositoryUrl=$(echo $response | jq -r .repository.url)
  module_github_name=$(echo $repositoryUrl | sed -n 's#.*github\.com/\(.*\)\.git#\1#p')
  echo "repositoryUrl: $repositoryUrl"
  echo "module_github_name: $module_github_name"
  git clone "https://github.com/${module_github_name}.git"
  cd "${module_github_name##*/}"
  npm i
  npm run test
fi
