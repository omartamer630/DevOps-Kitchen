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

vpc_content_file = 'vpc_details.txt'
ec2_content_file = 'ec2_details.txt'

with open(vpc_content_file, 'a') as file_object :
  file_object.write(str(all_vpcs()))


with open(ec2_content_file, 'a') as file_object:
  file_object.write(str(all_instances()))
