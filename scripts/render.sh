#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BUILD_DIR=$DIR/../build

eval "$(conda shell.bash hook)"
conda activate jupyter-notebooks

if [ -z "$1" ]; then
  echo "First argument must be the file name"
  exit
fi


if [ -z "$2" ]; then
  echo "Second argument must be a nbconvert compatible file format (e.g pdf or html)"
  exit
fi

mkdir -p $BUILD_DIR

export IS_CMD=1
FNAME=$(basename $1)
FNAME_NO_EXTENSION=${FNAME%.ipynb}
jupyter nbconvert --output-dir="$BUILD_DIR" --to notebook --execute "$1"
jupyter nbconvert $BUILD_DIR/$FNAME_NO_EXTENSION.ipynb --to $2
