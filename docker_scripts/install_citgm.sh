#! /bin/bash

if [ "$ENABLE_CITGM" = "true" ]; then
    npm i -g "https://github.com/pacostas/citgm.git#removed-undici"
fi