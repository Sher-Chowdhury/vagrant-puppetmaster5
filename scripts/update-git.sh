#!/bin/bash

echo '##########################################################################'
echo '################ About to run update-git.sh script #######################'
echo '##########################################################################'

yum -y install wget || exit 1
yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker

cd /usr/src
wget https://www.kernel.org/pub/software/scm/git/git-1.9.4.tar.gz || exit 1
tar xzf git-1.9.4.tar.gz

cd git-1.9.4
make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/bashrc
source /etc/bashrc

# git config --global push.default simple
