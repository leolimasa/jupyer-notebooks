#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BUILD_DIR=$DIR/../build
NB_DIR=$DIR/../notebooks
SCRIPTS_DIR=$DIR/../scripts

if [ -z "$1" ]; then
  echo "First argument must be render output type (e.g html)"
  exit
fi

ls $NB_DIR/*.ipynb | xargs -I{} $SCRIPTS_DIR/render.sh {} $1
