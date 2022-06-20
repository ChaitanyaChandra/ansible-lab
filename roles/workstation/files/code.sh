#!/bin/bash
yum install java-11-openjdk -y

yum install unzip -y

# install sonar
cd /opt
curl -O https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.5.0.2216-linux.zip
unzip sonar-scanner-cli-4.5.0.2216-linux.zip
rm -rf sonar
mv sonar-scanner-4.5.0.2216-linux sonar
ln -s /opt/sonar/bin/sonar-scanner /bin/sonar-scanner
curl -s https://raw.githubusercontent.com/linuxautomations/labautomation/master/tools/sonar-scanner/sonar-quality-gate >/bin/sonar-quality-gate.sh
chmod +x /bin/sonar-quality-gate.sh

# install nodejs
yum install gcc-c++ -y

URL=$(curl -s https://nodejs.org/en/download/ | xargs -n1 | grep linux-x64.tar | sed -e 's|=| |g' -e 's|>| |g'| xargs -n1 | grep ^http)
FILENAME=$(echo $URL | awk -F / '{print $NF}')
FOLDER_NAME=$(echo $FILENAME |sed -e 's/.tar.xz//')

curl -s -o /tmp/$FILENAME $URL
cd /opt
tar -xf /tmp/$FILENAME
mv $FOLDER_NAME nodejs
ln -s /opt/nodejs/bin/node /bin/node || true
ln -s /opt/nodejs/bin/npm /bin/npm  || true
ln -s /opt/nodejs/bin/npx /bin/npx || true