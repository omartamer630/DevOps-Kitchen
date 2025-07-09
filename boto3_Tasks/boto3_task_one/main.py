import boto3

# Select Region
region = 'us-east-1'

# Create Client 
ec2_client = boto3.client('ec2', region_name=region)

# Fetch All VPCs Details
def all_vpcs():
  available_vpcs = ec2_client.describe_vpcs()
  return available_vpcs["Vpcs"]

# Fetch All EC2s Details
def all_instances():
  available_ec2 = ec2_client.describe_instances()
  instances = []
  select_ec2 = available_ec2["Reservations"]
  for reservation in select_ec2:
    for ec2 in reservation["Instances"]:
        instances.append(ec2)
  return instances


def fetch_into_file(text_name , fetch_resource):
  with open(text_name, 'a') as file_object:
    file_object.write(str(fetch_resource))



vpc_content_file = 'vpc_details.txt'
ec2_content_file = 'ec2_details.txt'


fetch_into_file(vpc_content_file, all_vpcs())

fetch_into_file(ec2_content_file,all_instances())
