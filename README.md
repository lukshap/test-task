# test-task

There are 3 modules referencing to the 3 test tasks:

Q1.

Preferably using Terraform v12, 
- Write a terraform configuration to create an EC2 instance with a public IP and add an entry into the provided Route 53 zone pointing to the IP.
- Create an S3 bucket and an IAM role which when applied to the instance created in part one allows full control over the bucket.
 
For the next part  - do not overwrite your code to add this functionality - I’d like to see the code that was there before.  Simply create new code and comment that code for this next part.
- Using a loop, modify your code to create 5 instances and 5 DNS entries. 
   
Provisioning:
- terraform init
- terraform plan -input=true -var 'ec2_instance_count=2' -out=./tfplan   
- terraform apply ./tfplan 
- terraform destroy -auto-approve   
   
Q2.

A team have reported that they’ve hit the limit of 10000 images in several of their ECR repositories. Instead of manually deleting images, can you write a terraform module to remove images that are older than 60 days and to keep only the last 20 images in each repository.
  
Provisioning:
- terraform init
- terraform plan -input=true -var 'ecr_count=2' -out=./tfplan
- terraform apply ./tfplan 
- terraform destroy -auto-approve     
  
Q3. 
  
Using terraform, create an ECS Cluster with the following requirements.
- The cluster will be part of a VPC, however that VPC and any other networking components should be in a separate state file. 
- The ECS cluster will be part of an Auto Scaling Group in order for it to scale up and down. 
- You will need an Application Load Balancer that will redirect the traffic to the cluster. 
- Create an ECS service and assign it to an ALB listener, and include a task definition for it. 

Provisioning:
- terraform init
- terraform plan -input=false -out=./tfplan
- terraform apply ./tfplan 
- terraform destroy -auto-approve  
