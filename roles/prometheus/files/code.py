import os

APPS = os.environ.get('APPS')
ENV = os.environ.get('ENV')
DOMAIN = os.environ.get('DOMAIN')
new_list = []
for APP in APPS:
    new_list.append(f"{APP}-{ENV}-{DOMAIN}:9100")
print(new_list)