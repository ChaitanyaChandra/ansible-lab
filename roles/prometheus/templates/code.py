APPS = {{ APPS | to_json }}

ENV = "{{ENV}}"
DOMAIN = "{{DOMAIN}}"
new_list = []
for APP in APPS:
    new_list.append(APP+"-"+ENV+"-"+DOMAIN+":9100")
append_string = f"""
  - job_name: "nodes"
    static_configs:
      - targets: {new_list}
"""

print(append_string)

# Open a file with access mode 'a'
with open("/opt/prometheus/prometheus.yml", "a") as file_object:
    # Append 'hello' at the end of file
    file_object.write(append_string)