#!/bin/sh

# Download the lastest python 3 through Anaconda:
# https://www.anaconda.com/download/#linux

# Keep conda up to date
# conda update -n root conda
# conda update anaconda
# conda update --all

# Update pip
# pip install --upgrade pip 

# Jupyter lab extensions
# See list on https://github.com/search?utf8=%E2%9C%93&q=topic%3Ajupyterlab-extension&type=Repositories
# Interesting: https://github.com/jupyter-widgets/ipyleaflet
#jupyter labextension enable
#jupyter labextension install @jupyterlab/toc
#
#jupyter-nbextension install toc2/main
#jupyter-nbextension install codefolding/main
#jupyter-nbextension install execute_time/ExecuteTime
#jupyter-nbextension install export_embedded/main
#jupyter-nbextension install move_selected_cells/main
#jupyter-nbextension install collapsible_headings/main
#jupyter-nbextension install notify/notify

# Install 
conda install -y shapely pyproj tqdm seaborn xlrd
conda install -y -c conda-forge keras tensorflow folium nodejs # nodejs needed for jupyterlab extensions

pip install --upgrade pip

pip install msgpack pymysql pyvisgraph pyshp shapely geojson geopy \
    openpyxl flask bpython fuzzywuzzy faker bcrypt feather-format \
    mysql-connector geojsoncontour py-spy afinn nltk black shap \
    plotly pandas-gbq lime pdfminer.six geojsoncontour xgboost \
    selenium dexplot geocoder fpdf

pip install --upgrade google-cloud-storage google-cloud-bigquery 

# Jupyter enable plugins
pip install jupyter_nbextensions_configurator jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user
# Then visit http://localhost:8888/nbextensions after having started jupyter-notebook

# For NLTK run this to download sources:
#import nltk
#nltk.download()
