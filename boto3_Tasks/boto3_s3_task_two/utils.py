from botocore.exceptions import WaiterError


def list_bucket(buckets: list):
    """
    List All Available Buckets in default profile
    """
    print('Bucket List: \n')
    counter = 1
    for bucket in buckets:
        print(f'Bucket {counter} - {bucket}')
        counter += 1


def upload_file_in_the_bucket(bucket: str, file_path: str, file_name: str):
    """
    Upload Specific File in S3 Bucket
    """
    # Pick a random bucket
    print(f"Using bucket: {bucket.name}")
    print('Upload File is in Progress...')

    # Upload file
    bucket.upload_file(
        Filename=file_path, Key=file_name)
    print("File uploaded successfully.")


def does_object_exist(service_call: object, bucket: str, file_name: str):
    """
    Check if Specific Object Exist
    """
    waiter = service_call.get_waiter('object_exists')
    try:
        waiter.wait(
            Bucket=bucket.name,
            Key=file_name,
            WaiterConfig={
                'Delay': 5,
                'MaxAttempts': 3
            }
        )
        print("Object exists.")
    except WaiterError:
        print("Object does not exist.")


def list_bucket_object(service_call: object, bucket: str):
    """
    List All Available Objetcs in bucket
    """
    paginator = service_call.get_paginator('list_objects_v2')
    pages = paginator.paginate(
        Bucket=bucket.name
    )
    counter_page = 1
    counter_object = 1
    for page in pages:
        print("=" * 10)
        print(f"Page - {counter_page}")

        for obj in page["Contents"]:
            print(f"{counter_object} - {obj['Key']}")
            counter_object += 1
        counter_page += 1
