
![alt text](<WhatsApp Image 2025-04-16 at 20.30.26_9d6d8bdb.jpg>)
# Infrastructure definition for three tier web Application using Terraform

## Run Locally

## Terraform installed along eith aws configured is required to run the project.

## Read blog for detailed explanation of code.
[Hashnode Blog](https://nithin1.hashnode.dev/infrastructure-provisioning-for-deploying-three-tier-architecture)

Clone the project

```bash
  git clone https://github.com/Nithin-kasturi/InfraAsCode
```

Go to the project directory

```bash
  cd InfraAsCode
```

Go to the root directory

```bash
  cd root
```

Initialize dependencies

```bash
  terraform init
```

Press Enter if you are promted to enter IDS

Check validation

```bash
  terraform validate
```

Apply 

```bash
  terraform apply --auto-approve
```
## Press Enter if you are promted to enter IDS
![alt text](Outputs/apply.PNG)

## And you are done, visit your aws account [us-east-1] region to see the reources configured for you.

## VPC
![alt text](Outputs/vpc.PNG)

## Resource Map of VPC
![alt text](Outputs/vpc-resource-map.PNG)

## Intenet Gateway
![alt text](Outputs/Internet-Gateway.PNG)

## Subnets 
![alt text](Outputs/subnets.PNG)
![alt text](Outputs/db-tier.PNG)

## Route Tables
![alt text](Outputs/Route-tables.PNG)

## Elastic IPs
![alt text](Outputs/Elastic-ip.PNG)

## NAT Gateways
![alt text](Outputs/NAT.PNG)

## Security Groups
![alt text](Outputs/Security-Gropus.PNG)

## IAM
![alt text](Outputs/IAM.PNG)

## S3 Bucket
![alt text](Outputs/bucket.PNG)

## After you are done with the work, don't forget to destroy the resources to avoid unexpected charges[terraform destroy --auto-approve].
![alt text](Outputs/destroy.PNG)
