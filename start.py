import boto3
app = ["nodejs-internal", "internet-facing", "jenkins", "work-station", "sonar"]
region = 'us-east-1'
res_dict = {}

# ec2= boto3.resource('ec2', region_name=region)
# instances = ec2.meta.client.describe_instances()
# print(type(instances['Reservations'][0]['Instances']))
# for item in instances['Reservations']:
#     print(item['Instances'])

client = boto3.resource('ec2',region_name=region)
for instance in client.instances.all():
    print(
        "Name: {0}\nId: {1}\nPlatform: {2}\nType: {3}\nPublic IPv4: {4}\nAMI: {5}\nState: {6}\n".format(
            instance.tags[0]['Value'], instance.id, instance.platform, instance.instance_type, instance.public_ip_address, instance.image.id, instance.state)
    )
    res_dict[instance.tags[0]['Value']] = instance.id

client_two = boto3.client('ec2',region_name=region)
new_list = []
for item in app:
    new_list.append(res_dict[item])

responses = client_two.start_instances(
    InstanceIds=new_list,
    # DryRun=True # Make it False to test
    )
