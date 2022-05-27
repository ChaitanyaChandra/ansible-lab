import boto3
import json
import os

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
with open('roboshop.inv', 'w') as outfile:
    for key, value in current_dns.items():
        outfile.write(f'[{ key }]\n')
        outfile.write(f'{ value }\n')

# get key and user_name form secret manager
client = boto3.client('secretsmanager')
secret = client.get_secret_value(
    SecretId='ec2_private_key'
)
json_res = json.loads(secret['SecretString'])  # convert total string to dict/json
key = json_res['KEY']
user_name = json_res['USER_NAME']

# creating key file
with open(f'/home/{ user_name }/.ssh/key', 'w') as outfile:
    outfile.write(key)

# creating config file  ~/.ssh/config
with open(f'/home/{ user_name }/.ssh/config', 'w') as outfile:
    for key, value in current_dns.items():
        outfile.write(f'''
Host {key} { value }
    HostName { value }
    User { user_name }
    Port 22
    IdentityFile ~/.ssh/key
    StrictHostKeyChecking no''')

# read only permissions to key
os.chmod(f'/home/{ user_name }/.ssh/key', 400)
os.chmod(f'/home/{ user_name }/.ssh/config', 777 )