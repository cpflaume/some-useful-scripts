#!/bin/bash

if [ "$1" == "" ]
then {
        echo "Please provide a download link. The problem is, that you need to accept the licence agreements first "
        echo "Visit http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html, accept the license agreement \
and right-click on 'Linux x64   ???.?? MB       jdk-?u???-linux-x64.rpm' and copy the link "
        echo "The link contains a token which is valid for 30 minutes"
        echo "An example would be http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.rpm "
        exit 1
}
fi

link=$1
file=${link##*/}
echo "Download java with the link $link"
echo "The file to download is $file and will be installed subsequently"
echo wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  $link
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  $link

echo sudo yum install -y $file
sudo yum install -y $file

echo java -version
java -version
