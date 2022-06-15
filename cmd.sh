grep -rnw '/path/to/somewhere/' -e 'pattern'
git pull ; ansible-playbook roboshop.yml  \
  -e ENV=dev -e GIT_DOWNLOAD=yes \
  -t SHIPPING -f 30 -i roboshop.inv
# -f fork running, parallel
# -t tags
# -e env var
# -i inventory

# ansible community modules  for nodejs dependencies
mkdir -p ./collections/ansible_collections
ansible-galaxy collection install -r requirements.yml -p ./collections/

ansible-galaxy collection install community.general
git pull ; ansible-playbook main.yml -t nginx