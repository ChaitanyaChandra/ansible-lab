APPS = {{APPS | to_json}}
ENV = {{ENV}}
DOMAIN = {{DOMAIN}}
new_list = []
for APP in APPS:
    new_list.append(f"{APP}-{ENV}-{DOMAIN}:9100")
print(new_list)