set -e
conda create --name onto python=2 -y
source activate onto

# cannot use pip to install MySQL-python
conda install MySQL-python -y

cd ontonotes-release-5.0/tools/ontonotes-db-tool-v0.999b
python setup.py install
