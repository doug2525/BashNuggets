#!/bin/bash
### This script fetches the specified version of Golang and installs it. You may end up with multiple PATH entries.
echo "Backing up ~/.profile to ~/.profile.backup... Use it in case of corrupted ~/.profile"
cp -n ~/.profile ~/.profile.backup

if [ "$#" -ne 1 ]; then
    echo "Please pass Golang version (x.y.z) as a parameter"
    return 1
fi

VERSION=$1
wget -q -nc https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz -O go$VERSION.linux-amd64.tar.gz
tar -xzf go$VERSION.linux-amd64.tar.gz
rm -rf /usr/local/go/
mv go /usr/local
GOROOT=/usr/local/go
GOPATH=$HOME/go-projects
cp ~/.profile ~/.profile.old
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" > ~/.profile
cat ~/.profile.old >> ~/.profile
rm -f ~/.profile.old
. ~/.profile
echo "Congratulations! Golang $VERSION is now installed!"
