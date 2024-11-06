# Task - 2 - Bucket owner enforced and Bucket policy
ForgTech company wanna test your ability to type down a clean code by Deploying the structure of very simple resources. This will help you
to build a good reputation.
FrogTech is required to build an S3 Bucket with enabling versioning, Besides ensuring that only the Bucket owner has full access to objects
in order to assign other members access by setting the bucket ownership to “BucketOwnerEnforced.”
Create an IAM user called “Mohamed” and provide him access to upload files into /log directory at s3 Bucket via Bucket policy. Besides
ensuring that you can destroy the S3 (i.e. using terraform destroy command) even if the bucket is not empty.
Use IaC Terraform to build all resources and consider the below requirements specifications.
```bash
1. Resources must be created at the us-east-1 region.
2. Resources must have tags as below:
a. Key: “Environment”, Value: “terraformChamps”
b. Key: “Owner”, Value: <“Your_first_name“>
3. Preferd to use variables
```
