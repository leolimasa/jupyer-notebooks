#!/bin/bash
# Avoid "JavaScript heap out of memory" errors during extension installation
export NODE_OPTIONS=--max-old-space-size=4096

eval "$(conda shell.bash hook)"
conda env create -f environment.yml
conda activate jupyter-notebooks
jupyter labextension install jupyterlab_vim --no-build
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build
jupyter labextension install jupyterlab-plotly --no-build
jupyter labextension install plotlywidget --no-build
jupyter lab build
