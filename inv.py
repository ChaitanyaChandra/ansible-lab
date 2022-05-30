import boto3
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
with open('roboshop.inv', 'w', encoding='utf-8') as outfile:
    for key, value in current_dns.items():
        outfile.write(f'[{ key }]\n')
        outfile.write(f'{ value }\n')

# get key and user_name form secret manager
client = boto3.client('secretsmanager')
secret = client.get_secret_value(
    SecretId='ec2_private_key'
)

# get user_name form jenkins if no user_name is defined go to else block and assign username of current OS(jenkins slave) 
if os.environ.get('USER_NAME'):
    pass
else:
    user_name = os.environ['USER']

# deleting old key file 
if os.path.isfile(f'/home/{ user_name }/.ssh/key'):
    os.system(f'rm -rf /home/{ user_name }/.ssh/key')

# deleting old config file
if os.path.isfile(f'/home/{ user_name }/.ssh/config'):
    os.system(f'rm -rf /home/{ user_name }/.ssh/config')

# creating key file    
with open(f'/home/{ user_name }/.ssh/key', 'w', encoding='utf-8') as outfile:
    outfile.write(secret['SecretString'])

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
os.system(f'chmod 0400 /home/{ user_name }/.ssh/key')