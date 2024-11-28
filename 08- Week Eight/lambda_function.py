import boto3
import os

s3 = boto3.client('s3')

def lambda_handler(event, context):
    source_bucket = os.environ['SOURCE_BUCKET']
    dest_bucket = os.environ['DEST_BUCKET']
    
    for record in event['Records']:
        source_key = record['s3']['object']['key']
        copy_source = {'Bucket': source_bucket, 'Key': source_key}
        
        s3.copy_object(
            CopySource=copy_source,
            Bucket=dest_bucket,
            Key=source_key
        )
        
        s3.delete_object(
            Bucket=source_bucket,
            Key=source_key
        )
        
    return {
        'statusCode': 200,
        'body': 'File transfer completed'
    }
