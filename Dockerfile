FROM jenkins/jenkins
USER root
RUN apt-get update
RUN apt-get install -y  \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" -y
RUN apt-get update
RUN apt-get install -y docker-ce
RUN usermod -u 2005 jenkins
RUN groupmod -g 2004 jenkins
# drop back to the regular jenkins user - good practice
USER jenkins
