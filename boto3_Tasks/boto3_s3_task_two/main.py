import random
import boto3
from utils import list_bucket, upload_file_in_the_bucket, does_object_exist, list_bucket_object

# Select Region
REGION = 'us-east-1'

S3 = boto3.resource('s3')
S3_CLIENT = boto3.client('s3', region_name=REGION)

buckets = list(S3.buckets.all())
random_bucket = random.choice(buckets)


if not buckets:
    print("No buckets available.")
else:
    list_bucket(buckets)

    upload_file_in_the_bucket(
        random_bucket, './dummy_file.txt', 'dummy_file.txt')
    
    does_object_exist(
        S3_CLIENT, random_bucket, 'dummy_file.txt')
    list_bucket_object(
        S3_CLIENT, random_bucket
    )
    
