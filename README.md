# AWS Infrastructure Automation using Terraform (Modular Project)

## 📌 Project Overview
This project demonstrates how to provision AWS infrastructure using Terraform with a modular folder structure. Each AWS service is organized in a separate folder, and each folder contains Terraform configuration files:

- provider.tf
- variables.tf
- main.tf
- outputs.tf
- terraform.tfvars

This project follows Infrastructure as Code (IaC) and real-world DevOps practices where infrastructure is automated instead of manually creating resources in AWS Console.

---

## 🧱 AWS Services Used

| Service | Purpose |
|--------|---------|
| VPC | Virtual network |
| Subnet | Public/Private network |
| Internet Gateway | Internet access |
| Route Table | Routing |
| Security Group | Firewall |
| EC2 | Virtual server |
| Auto Scaling | Automatic scaling |
| Load Balancer (ALB/NLB) | Traffic distribution |
| RDS | Database |
| S3 | Storage |
| IAM | Roles & permissions |
| Lambda | Serverless compute |
| CloudWatch | Monitoring |
| SNS | Notifications |
| DynamoDB | Terraform state locking |

---

## ⚙️ Terraform Workflow (Important)

Terraform workflow always follows this process:

terraform init → terraform validate → terraform plan → terraform apply → terraform destroy

---

## 📌 Terraform Commands Explanation

### 1️⃣ terraform init

Command:
terraform init

Purpose:
- Initializes Terraform
- Downloads AWS provider plugins
- Creates .terraform folder
- Creates .terraform.lock.hcl file
- Prepares working directory

Files created after terraform init:

| File/Folder | Purpose |
|-------------|---------|
| .terraform/ | Provider plugins |
| .terraform.lock.hcl | Provider version lock |
| terraform.tfstate | Infrastructure state |
| terraform.tfstate.backup | Backup state file |

Explanation:
terraform init initializes the project and downloads the required provider (AWS). It prepares Terraform to create infrastructure.

---

### 2️⃣ terraform validate

Command:
terraform validate

Purpose:
- Checks syntax errors
- Validates Terraform code
- Does NOT create infrastructure

Explanation:
This command ensures your Terraform code is syntactically correct before running it.

---

### 3️⃣ terraform plan

Command:
terraform plan

Purpose:
- Shows what Terraform will create/update/delete
- Preview of infrastructure changes
- Does NOT create resources

Example Output:
Plan: 3 to add, 0 to change, 0 to destroy

Explanation:
Terraform compares your .tf files with the terraform.tfstate file and shows the difference between current infrastructure and new configuration.

---

### 4️⃣ terraform apply

Command:
terraform apply

Purpose:
- Creates infrastructure in AWS
- Updates terraform.tfstate file
- Actually provisions resources

Explanation:
This command creates AWS resources like VPC, EC2, Subnet, Load Balancer, etc.

---

### 5️⃣ terraform destroy

Command:
terraform destroy

Purpose:
- Deletes all resources created by Terraform
- Prevents AWS billing
- Removes infrastructure

---

## 📌 Important Terraform Files Explanation

| File | Purpose |
|------|---------|
| provider.tf | AWS provider configuration |
| variables.tf | Input variables |
| main.tf | Resource creation |
| outputs.tf | Output values |
| terraform.tfvars | Variable values |
| terraform.tfstate | Current infrastructure state |
| terraform.tfstate.backup | Backup state |
| .terraform | Provider plugins |

---

## 📌 What is terraform.tfstate? (Very Important)

Terraform state file stores:
- Resource IDs
- Resource names
- Infrastructure details
- Mapping between Terraform and AWS resources

Without state file, Terraform does not know what it created.

---

## 📌 Remote Backend (Industry Practice)

In real-world projects:
- S3 → Stores terraform.tfstate
- DynamoDB → State locking

This prevents multiple people from changing infrastructure at the same time.

---

## 🌐 AWS Architecture (3-Tier Architecture)

Internet
   │
Internet Gateway
   │
Route Table
   │
Public Subnet
   │
Load Balancer
   │
Auto Scaling Group
   │
EC2
   │
Security Group
   │
Private Subnet
   │
RDS

Monitoring:
CloudWatch → SNS → Email Notification

Serverless:
Lambda Function

---

## 📌 Order of Terraform Execution

1. vpc
2. subnet
3. internet_gateway
4. route_table
5. security_group
6. ec2
7. auto_scaling
8. alb / nlb
9. rds
10. sns
11. cloudwatch
12. lambda

---

## 📚 Skills Demonstrated in This Project

- Terraform
- AWS Cloud
- Infrastructure as Code (IaC)
- VPC Networking
- EC2 & Auto Scaling
- Load Balancer
- IAM Roles
- Lambda
- CloudWatch Monitoring
- SNS Notifications
- Remote Backend (S3 + DynamoDB)
- Modular Terraform Architecture

---

## 👨‍💻 Author

Akash Aralikatti  
GitHub:  https://github.com/akashak0717
LinkedIn: www.linkedin.com/in/akasharalikatti0717  
Email: akasharalikatti04@gmail.com

---

## ⭐ Conclusion

This project demonstrates how to design, provision, and manage a scalable AWS infrastructure using Terraform with a modular approach. It includes networking, compute, monitoring, scaling, and serverless services, similar to real-world production environments.

---

## 📌 .gitignore (Important)

.terraform/
*.tfstate
*.tfstate.backup
terraform.tfvars
lambda.zip
