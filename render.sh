#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate jupyter-notebooks

if [ -z "$1" ]; then
  echo "First argument must be the file name without .ipynb extension"
  exit
fi


if [ -z "$2" ]; then
  echo "Second argument must be a nbconvert compatible file format (e.g pdf or html)"
  exit
fi

IS_CMD=1 jupyter nbconvert --to notebook --execute "$1.ipynb" && jupyter nbconvert $1.nbconvert.ipynb --to $2
