module "vpc" {
  source = "../modules/vpc"
  region = var.region
  App-Tier-1a-cidr = var.App-Tier-1a-cidr
  App-Tier-1b-cidr = var.App-Tier-1b-cidr 
  Web-Tier-1a-cidr = var.Web-Tier-1a-cidr
  Web-Tier-1b-cidr = var.Web-Tier-1b-cidr
  DB-Tier-1a-cidr = var.DB-Tier-1a-cidr
  DB-Tier-1b-cidr = var.DB-Tier-1b-cidr
}
module "securitygroups"{
  source = "../modules/securitygroups"
  vpc_id = module.vpc.vpc_id
}
module "iam" {
  source = "../modules/iam"
}
module "nat" {
  source = "../modules/nat"
  vpc_id = module.vpc.vpc_id
  Web_Tier_Subnet1_id= module.vpc.Web_tier_Subnet1_id
  App_Tier_Subnet1_id=module.vpc.App_Tier_Subnet1_id
  Web_Tier_Subnet2_id=module.vpc.Web_tier_Subnet2_id
  App_Tier_Subnet2_id=module.vpc.App_Tier_Subnet2_id
}
module "s3"{
  source = "../modules/s3"
}