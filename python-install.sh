#!/bin/sh

# Download the lastest python 3 through Anaconda:
# https://www.anaconda.com/download/#linux

# Update pip and conda
# conda update -n base -c defaults conda
# conda update -n base conda
# pip install --upgrade pip 

# Install 
conda install -y shapely pyproj tqdm seaborn xlrd
conda install -y -c conda-forge keras tensorflow folium

pip install --upgrade pip

pip install msgpack pymysql pyvisgraph pyshp shapely geojson geopy \
    openpyxl flask bpython fuzzywuzzy faker bcrypt feather-format \
    mysql-connector geojsoncontour py-spy afinn nltk black shap \
    plotly pandas-gbq lime pdfminer.six geojsoncontour xgboost \
    selenium

pip install --upgrade google-cloud-storage google-cloud-bigquery 

# For NLTK run this to download sources:
#import nltk
#nltk.download()
