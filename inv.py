import boto3
import json
import os
import ast

# export aws cli env variable
os.environ['AWS_DEFAULT_REGION'] = 'us-east-1'

route53 = boto3.client('route53')
app = ["mongodb", "redis", "rabbitmq", "mysql", "catalogue", "user", "cart", "shipping", "payment", "dispatch",
       "frontend"]
env = "dev"
domain = "roboshop.internal."
new_list = []  # fqdn

for item in app:
    new_list.append(f'{item}-{env}.{domain}')

res_dict = {}

response = route53.list_hosted_zones()
for item in response['HostedZones']:
    # print(item)
    if item['Name'] == domain:
        res_dict[item['Name']] = item['Id']

current_dns = {}
sub = f'-{env}.{domain}'
dns_records = route53.list_resource_record_sets(HostedZoneId=res_dict[domain])
for item in dns_records['ResourceRecordSets']:
    if item['Type'] == 'A':
        if item['Name'] in new_list:
            current_dns[item['Name'].replace(sub, "").upper()] = item['Name'].strip('.')

# print(current_dns)
# creating inv file
with open('roboshop.inv', 'w', encoding='utf-8') as outfile:
    for key, value in current_dns.items():
        outfile.write(f'[{ key }]\n')
        outfile.write(f'{ value }\n')


user_name = os.environ['USER_NAME']

# creating config file  ~/.ssh/config
with open(f'/home/{ user_name }/.ssh/config', 'w', encoding='utf-8') as outfile:
    for key, value in current_dns.items():
        outfile.write(f'''
Host {key.lower()} { value }
    HostName { value }
    User { user_name }
    Port 22
    IdentityFile ~/.ssh/key
    StrictHostKeyChecking no''')

os.system(f'chmod 0600 /home/{ user_name }/.ssh/config')