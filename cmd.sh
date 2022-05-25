grep -rnw '/path/to/somewhere/' -e 'pattern'
git pull ; ansible-playbook roboshop.yml  \
  -e ENV=dev -e GIT_DOWNLOAD=yes \
  -t SHIPPING -f 30 -i roboshop.inv
# -f fork running, parallel
# -t tags
# -e env var
# -i inventory

 git pull ; ansible-playbook roboshop.yml  -e ENV=dev -e GIT_DOWNLOAD=yes