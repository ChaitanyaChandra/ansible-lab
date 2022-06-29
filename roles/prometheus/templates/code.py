import json
APPS = {{ APPS | to_json }}

ENV = "{{ENV}}"
DOMAIN = "{{DOMAIN}}"
new_list = []
for APP in APPS:
    new_list.append(f'{APP}-{ENV}-{DOMAIN}:9100')
    with open("/opt/prometheus/prometheus.yml", "a") as file_object:
        file_object.write(f"""
  - job_name: "{APP}"
    static_configs:
      - targets: ["{APP}-{ENV}-{DOMAIN}:9100"]
""")
print(json.dumps(new_list))