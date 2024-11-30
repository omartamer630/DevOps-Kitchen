import boto3
import os

def lambda_handler(event, context):
    # Initialize SSM client
    ssm_client = boto3.client('ssm')

    # Get environment variables
    instance_id = os.environ['INSTANCE_ID']  # EC2 instance ID from environment variable
    document_name = os.environ.get('SSM_DOCUMENT_NAME', 'RestartSSHService')  # Default to 'RestartSSHService'

    # Run the SSM command
    response = ssm_client.send_command(
        InstanceIds=[instance_id],
        DocumentName=document_name
    )

    return response
