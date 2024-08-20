#! /bin/bash

NPM_MODULE=$1
ENABLE_CITGM=$2

PACKAGE_MANAGER=$(jq -r .[\"${NPM_MODULE}\"].package_manager ./supported_modules.json)

if [ "$ENABLE_CITGM" = "true" ]; then
  npm i -g citgm
  citgm $NPM_MODULE
else
  response=$(curl -s "https://registry.npmjs.org/${NPM_MODULE}")
  repositoryUrl=$(echo $response | jq -r .repository.url)
  module_github_name=$(echo $repositoryUrl | sed -n 's#.*github\.com/\(.*\)\.git#\1#p')
  echo "repositoryUrl: $repositoryUrl"
  echo "module_github_name: $module_github_name"
  git clone "https://github.com/${module_github_name}.git"
  cd "${module_github_name##*/}"

  if [ "$PACKAGE_MANAGER" = "yarn" ]; then
    npm install --global yarn
    yarn install
    yarn test
  else
    npm install
    npm test
  fi
fi
