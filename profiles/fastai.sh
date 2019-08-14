# This will run as root

# introduction-to-reinforcement-learning, webinar from O'Reilly
#su jupyter -c "cd ; git clone https://resources.oreilly.com/live-training/introduction-to-reinforcement-learning.git"

# Jon Krohn course on O'Reilly
#su jupyter -c "cd ; git clone https://github.com/the-deep-learners/TensorFlow-LiveLessons.git"

# DeepSchool.io repo
#su jupyter -c "cd ; git clone https://github.com/sachinruk/deepschool.io.git"

# Machine Learning and Deep Learning in Python using Scikit-Learn, Keras and TensorFlow 2 by Aurelien Geron, O'Reilly
su jupyter -c "cd ; git clone https://github.com/ageron/handson-ml2.git"

# Install my .gitconfig
su jupyter -c "wget https://gist.githubusercontent.com/adumont/1380188/raw/.gitconfig -O ~/.gitconfig"

# My notes & notebooks for ML & DL, by @adumont
su jupyter -c "cd ; git clone https://github.com/adumont/ml-dl-notes.git; cd ml-dl-notes/; tools/run-after-git-clone"

# Link to fastai notebooks in home dir
su jupyter -c "cd ; ln -s tutorials/fastai/course-v3/nbs fastai"
