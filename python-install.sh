#!/bin/sh

# Download the lastest python 3 through Anaconda:
# https://www.anaconda.com/download/#linux

# Install 
conda install shapely pyproj tqdm seaborn xlrd keras
conda install -c conda-forge folium
pip install pyvisgraph pyshp shapely geojson geopy openpyxl flask bpython fuzzywuzzy
