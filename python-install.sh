#!/bin/sh

# Download the lastest python 3 through Anaconda:
# https://www.anaconda.com/download/#linux
# Wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# Export current environment
# conda env export > environment.yml

# Create a environment based on a YAML file
# conda env create -f environment.yml

# Update a environment
# conda env update –f environment.yml –n data_quality

# Remove environment
# conda remove --name data_quality --all

# Activate a environment
# conda activate data-quality

# List environments
# conda info --envs

# Keep conda up to date
# conda update -n root conda
# conda update anaconda
# conda update --all

# Update pip
# pip install --upgrade pip 



#####################
# Package install
#####################

# Install 
conda install numpy pandas PyMySQL tqdm pyarrow matplotlib seaborn openpyxl XlsxWriter xlrd psutil \
    SQLAlchemy mysql-connector-python nose shapely pyproj plotly pyshp nltk black bcrypt selenium \
    geopandas descartes snakeviz
conda install -c conda-forge google-cloud-bigquery google-cloud-storage slackclient \
    sendgrid folium nodejs ipyvolume jupyter_contrib_nbextensions
conda install -c viascience fpdf 

# Packages not possible to install using conda
pip install msgpack pyvisgraph geojson geopy openpyxl bpython fuzzywuzzy feather-format py-spy afinn shap \
    pandas-gbq lime pdfminer.six geojsoncontour xgboost dexplot geocoder mplleaflet sqlint

# Upgrade Google elements
#pip install --upgrade google-cloud-storage google-cloud-bigquery 

# Not needed at the moment
#conda install -y -c conda-forge keras tensorflow
#pip install flask faker

# For NLTK run this to download sources:
#import nltk
#nltk.download()



#############
# Jupyter
#############
# Jupyter enable plugins
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user
# Then visit http://localhost:8888/nbextensions after having started jupyter-notebook

# Jupyter lab extensions
# See list on https://github.com/search?utf8=%E2%9C%93&q=topic%3Ajupyterlab-extension&type=Repositories
# Interesting: https://github.com/jupyter-widgets/ipyleaflet
# jupyter labextension enable
# jupyter labextension install @jupyterlab/toc

# Jupyter notebooks
# pip install jupyter_contrib_nbextensions
# jupyter contrib nbextension install --user
# jupyter nbextensions_configurator enable --user
# http://localhost:8888/nbextensions
# * toc2/main
# * codefolding/main
# * execute_time/ExecuteTime
# * export_embedded/main
# * move_selected_cells/main
# * collapsible_headings/main
# * notify/notify

