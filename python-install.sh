#!/bin/sh

# Download the lastest python 3 through Anaconda:
# https://www.anaconda.com/download/#linux

# conda update -n base conda
# pip install --upgrade pip 

# Install 
conda install shapely pyproj tqdm seaborn xlrd
conda install -c conda-forge keras tensorflow folium
pip install pyvisgraph pyshp shapely geojson geopy openpyxl flask bpython fuzzywuzzy faker bcrypt
