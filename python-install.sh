#!/bin/sh

# Download the lastest python 3 through Anaconda:
# https://www.anaconda.com/download/#linux

# conda update -n base conda
# pip install --upgrade pip 

# Install 
conda install -y shapely pyproj tqdm seaborn xlrd
conda install -y -c conda-forge keras tensorflow folium
pip install msgpack pymysql pyvisgraph pyshp shapely geojson geopy openpyxl flask bpython fuzzywuzzy faker bcrypt feather-format
