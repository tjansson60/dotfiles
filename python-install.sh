#!/bin/sh

# Download and install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Miniconda3-latest-Linux-x86_64.sh
bash ~/Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3

# Setup the dev environment based on the YML file
conda env create --name dev --file conda-dev-python-environment.yml

# Set up jupyter-notebook and jupyterlab
./jupyter-setup.sh


# Install libs through conda and conda channels
# conda install -y numpy pandas PyMySQL tqdm pyarrow matplotlib seaborn openpyxl XlsxWriter xlrd psutil \
#     SQLAlchemy mysql-connector-python nose shapely pyproj plotly pyshp nltk black bcrypt selenium \
#     geopandas descartes snakeviz datashader holoviews
# conda install -y -c conda-forge google-cloud-bigquery google-cloud-storage slackclient \
#     sendgrid folium nodejs ipyvolume jupyter_contrib_nbextensions jupyterlab pythreejs ipywidgets
# conda install -y -c viascience fpdf 
# 
# # Packages not possible to install using conda
# pip install msgpack pyvisgraph geojson geopy openpyxl bpython fuzzywuzzy feather-format py-spy afinn shap \
#     pandas-gbq lime pdfminer.six geojsoncontour xgboost dexplot geocoder mplleaflet sqlint

# Upgrade Google elements
# pip install --upgrade google-cloud-storage google-cloud-bigquery 

# Not needed at the moment
#conda install -y -c conda-forge keras tensorflow
#pip install flask faker

# For NLTK run this to download sources:
#import nltk
#nltk.download()

#######################
# Conda tips
#######################

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
