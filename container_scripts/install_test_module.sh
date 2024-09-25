#! /bin/bash

NPM_MODULE=$1
ENABLE_CITGM=$2

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

  if [ $NPM_MODULE = "@langchain/core" ]; then
    # copied from https://github.com/langchain-ai/langchainjs/blob/main/.github/workflows/unit-tests-langchain-core.yml
    export PUPPETEER_SKIP_DOWNLOAD="true"
    export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD="true"
    npm install --global yarn
    yarn install --immutable
    yarn build --filter=@langchain/core
    yarn run test:unit:ci --filter=@langchain/core
  else
    if [ $NPM_MODULE = "langchain" ]; then
      # copied from https://github.com/langchain-ai/langchainjs/blob/main/.github/workflows/unit-tests-langchain.yml
      export PUPPETEER_SKIP_DOWNLOAD="true"
      export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD="true"
      npm install --global yarn
      yarn install --immutable
      yarn build --filter=langchain
      yarn run test:unit:ci --filter=langchain
    else
      npm install
      npm test
    fi
  fi
fi
