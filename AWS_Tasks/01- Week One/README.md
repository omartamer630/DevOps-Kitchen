# Setting Up S3 Lifecycle Policies
Objective: Implement lifecycle rules for cost management and efficient storage.
Process: Used Terraform to create an S3 bucket with multiple directories and lifecycle rules for transitioning files to Standard-IA, Glacier, and Deep Archive, and setting expiration.
Learnings: Gained hands-on experience with S3 lifecycle transitions and retention policies, understanding how they optimize storage costs for long-term data.
# Configuring IAM Policies for S3 and Access Management
Objective: Manage fine-grained access to the S3 bucket.
Process: Created IAM users and roles with specific access policies, including conditions for IP restrictions and bucket policy enforcement.
Learnings: Mastered creating IAM policies for various use cases, including user access restrictions and permissions based on IP. Learned how to securely manage S3 access using roles for team access.
# Setting Up a Custom VPC
Objective: Deploy a subnet with internet access and custom VPC configurations instead of using AWS defaults.
Process: Configured VPC resources, including subnets, internet gateway, and route tables in Terraform.
Learnings: Understood the basics of network isolation and public/private access in AWS, creating a custom VPC setup that can be expanded for complex infrastructures.

```bash
A big thanks to Eng. Mohamed el Eraki for reviewing my code and dedicating his time to guide me through these tasks. his support was invaluable in helping me understand complex Terraform configurations and AWS services more deeply.
```
