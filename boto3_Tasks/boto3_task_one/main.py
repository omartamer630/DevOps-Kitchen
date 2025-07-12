import boto3

# Select Region
REGION = 'us-east-1'

# Create Client
ec2_client = boto3.client('ec2', region_name=REGION)

# Fetch All VPCs Details
def all_vpcs():
    """
    Fetch Every Detail in All VPCs in AWS Account
    Return All Details in Json
    """
    available_vpcs = ec2_client.describe_vpcs()
    return available_vpcs["Vpcs"]

# Fetch All EC2s Details
def all_instances():
    """
    Fetch Every Detail in EC2s in AWS Account
    Return All Details in Json
    """
    available_ec2 = ec2_client.describe_instances()
    instances = []
    select_ec2 = available_ec2["Reservations"]
    for reservation in select_ec2:
        for ec2 in reservation["Instances"]:
            instances.append(ec2)
    return instances


def fetch_into_file(text_name = '', fetch_resource = ''):
    """
    First Parameter (text_name) = file name
    Second Parameter (fetch_resource) = file that i will put the fetched data in it

    Fetch Every Detail in All VPCs and EC2 in File text_name
    """
    with open(text_name, 'a',  encoding="utf-8") as file_object:
        file_object.write(str(fetch_resource))


VPC_FILE = 'vpc_details.txt'
EC2_FILE = 'ec2_details.txt'


fetch_into_file(VPC_FILE, all_vpcs())

fetch_into_file(EC2_FILE, all_instances())
