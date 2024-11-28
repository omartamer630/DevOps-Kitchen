# AWS Lambda File Transfer Automation

## Task Purpose
This Project Focus on Automate file transfer from external S3 Bucket to Internal S3 Bucket

## Components
1. S3 Buckets: Two S3 Buckets (forgtech-external, and forgtech-internal)
2. Lambda Function: Lambda Function using *lambda_function.py* code and it's triggred by ```bash frogtech-us-external```Bucket
3. IAM Role and Policy: Lamnda Function uses S3 bucket so we need to use *Getobject*, *Putobject*, and*Deleteobject*

File Structure
```bash
.
├── .terraform/
├── README.md
├── .gitignore
├── .terraform.lock.hcl
├── iam.tf
├── lambda_function.py
├── lambda.tf
├── lambda.zip
├── provider.tf
├── s3.tf
├── terraform.tfvars
└── variable.tf
```
Setup
1. Prepare Lambda Code
 - Run ```bash zip -r lambda.zip lambda_function.py```
2. Apply Terraform Configuration
 - initialize Terraform: ``bash terraform init```
 - Apply the configuration: ``bash terraform apply```
3. Test:
 - Upload a file to the frogtech-us-external bucket and check if it is automatically transferred to the frogtech-us-internal bucket.
