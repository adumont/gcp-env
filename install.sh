#!/bin/bash
# curl https://raw.githubusercontent.com/adumont/gcp-env/master/install.sh | bash

cd

if [ -d gcp-env ]
then
  echo "Already installed? Skipping"
  exit 1
fi

# clone this repo
git clone https://github.com/adumont/gcp-env.git

# add the bashrc stuff to user's bashrc
[ -e gcp-env/bashrc ] && cat gcp-env/bashrc >> ~/.bashrc
source .bashrc

# add my .gitconfig
cd ; wget https://gist.githubusercontent.com/adumont/1380188/raw/.gitconfig
