sudo useradd -r -s /bin/false jenkins
sudo usermod -u 2005 jenkins
sudo usermod -aG docker jenkins
