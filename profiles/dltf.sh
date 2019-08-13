# This will run as root

# Install my .gitconfig
su jupyter -c "wget https://gist.githubusercontent.com/adumont/1380188/raw/.gitconfig -O ~/.gitconfig"

# My notes & notebooks for ML & DL, by @adumont
su jupyter -c "cd ; git clone https://github.com/adumont/ml-dl-notes.git"

# introduction-to-reinforcement-learning, webinar from O'Reilly
su jupyter -c "cd ; git clone https://resources.oreilly.com/live-training/introduction-to-reinforcement-learning.git"

# DeepSchool.io repo
su jupyter -c "cd ; git clone https://github.com/sachinruk/deepschool.io.git"

# Machine Learning and Deep Learning in Python using Scikit-Learn, Keras and TensorFlow 2 by Aurelien Geron, O'Reilly
su jupyter -c "cd ; git clone https://github.com/ageron/handson-ml2.git"

####################################################
# Jon Krohn course on O'Reilly
su jupyter -c "cd ; git clone https://github.com/the-deep-learners/TensorFlow-LiveLessons.git"

# Requirements, see https://github.com/the-deep-learners/TensorFlow-LiveLessons/blob/master/Dockerfile

# install tflearn and keras: 
pip install tflearn==0.3.2
pip install keras==2.0.8

# install NLP packages:
pip install nltk==3.2.4
pip install gensim==2.3.0

# install Reinforcement Learning packages:
pip install gym==0.9.4
