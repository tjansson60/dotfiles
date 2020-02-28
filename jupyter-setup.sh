#!/bin/sh

# jupyter-notebook setup 
# pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user
# Then visit http://localhost:8888/nbextensions after having started jupyter-notebook

# Jupyter notebook extensions
jupyter nbextension enable codefolding/main
jupyter nbextension enable toc2/main
jupyter nbextension enable codefolding/main
jupyter nbextension enable execute_time/ExecuteTime
jupyter nbextension enable export_embedded/main
jupyter nbextension enable move_selected_cells/main
jupyter nbextension enable collapsible_headings/main
jupyter nbextension enable notify/notify

# Jupyter lab extensions
jupyter labextension enable
jupyter labextension install @jupyterlab/toc
jupyter labextension install @jupyterlab/dataregistry-extension

