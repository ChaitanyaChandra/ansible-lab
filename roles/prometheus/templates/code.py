APPS = {{ APPS | to_json }}

ENV = "{{ENV}}"
DOMAIN = "{{DOMAIN}}"
new_list = []
for APP in APPS:
    new_list.append(f"{APP}-{ENV}-{DOMAIN}:9100")

print(f"my list is {new_list}")
append_string = f"""
  - job_name: "nodes"
    static_configs:
      - targets: {new_list}
"""



# Open a file with access mode 'a'
with open("/opt/prometheus/prometheus.yml", "a") as file_object:
    # Append 'hello' at the end of file
    file_object.write(append_string)