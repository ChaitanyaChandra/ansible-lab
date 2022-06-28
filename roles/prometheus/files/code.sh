URL=$(curl -L -s https://prometheus.io/download/  | grep tar | grep prometheus- | grep linux-amd64  | sed -e "s|>| |g" -e 's|<| |g' -e 's|"| |g' |xargs -n1 | grep ^http | tail -1)

FILENAME=$(echo $URL | awk -F / '{print $NF}')
DIRNAME=$(echo $FILENAME | sed -e 's/.tar.gz//')

cd /opt
curl -s -L -O $URL
tar -xf $FILENAME
rm -f $FILENAME
mv $DIRNAME prometheus

curl -s https://raw.githubusercontent.com/majorchowdary/labautomation/master/tools/prometheus-server/prometheus.service >/etc/systemd/system/prometheus.service
systemctl enable prometheus
systemctl start prometheus