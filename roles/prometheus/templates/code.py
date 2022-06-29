import json
APPS = {{ APPS | to_json }}

ENV = "{{ENV}}"
DOMAIN = "{{DOMAIN}}"
new_list = []
for APP in APPS:
    new_list.append(f'{APP}-{ENV}-{DOMAIN}:9100')
print(json.dumps(new_list))

with open("/opt/prometheus/prometheus.yml", "a") as file_object:
    file_object.write(f"""
  - job_name: "node"
    static_configs:
      - targets: {json.dumps(new_list)}
""")