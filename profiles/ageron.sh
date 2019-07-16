# This will run as root

# introduction-to-reinforcement-learning, webinar from O'Reilly
su jupyter -c "cd ; git clone https://resources.oreilly.com/live-training/introduction-to-reinforcement-learning.git"

# Jon Krohn course on O'Reilly
su jupyter -c "cd ; git clone https://github.com/the-deep-learners/TensorFlow-LiveLessons.git"

# DeepSchool.io repo
su jupyter -c "cd ; git clone https://github.com/sachinruk/deepschool.io.git"

###########################################################################
# Machine Learning and Deep Learning in Python using Scikit-Learn, Keras and TensorFlow 2 by Aurelien Geron, O'Reilly
su jupyter -c "cd ; git clone https://github.com/ageron/handson-ml2.git"

# Reference: https://github.com/ageron/handson-ml2/blob/master/docker/Dockerfile

apt-get update && apt-get upgrade -y \
    && apt-get install -y \
        libpq-dev \
        build-essential \
        git \
        sudo \
        cmake zlib1g-dev libjpeg-dev xvfb libav-tools xorg-dev libboost-all-dev libsdl2-dev swig \
        unzip zip

conda update -n base conda
conda install -y \
        joblib \
        PyYAML==3.13
conda install -y -c conda-forge \
        pyopengl \
        xgboost \
        nbdime
pip install "urlextract"
pip install "gym[atari,box2d,classic_control]"
pip install "tensorflow-hub"
pip install "tensorflow-serving-api"
pip install "tfx"
pip install "tensorflow-addons"
pip install "tf-agents-nightly"
pip install "tfds-nightly"
pip install "tfp-nightly"
#pip uninstall -y tensorflow
#pip uninstall -y tensorboard
#pip install "tf-nightly-2.0-preview"
#pip install "tb-nightly"
