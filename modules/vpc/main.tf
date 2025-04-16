#Create a VPC
resource "aws_vpc" "Three-Tier-VPC-Resource" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  
  enable_dns_hostnames    = true
  enable_dns_support =  true
  tags={
    Name="${var.Project_Name}-VPC"
  }
}
#Attach Internet gateway to Three-Tier-VPC
resource "aws_internet_gateway" "Three-tier-IGW-Resource" {
  vpc_id = aws_vpc.Three-Tier-VPC-Resource.id
  tags = {
    Name="${var.Project_Name}-IGW"
  }
}
#Create a Route table for Three-tier-VPC
resource "aws_route_table" "Three-Tier-Public-RT-Resource" {
  vpc_id = aws_vpc.Three-Tier-VPC-Resource.id
  route  {
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.Three-tier-IGW-Resource.id
  }
  tags = {
    Name="Public-RT"
  }
}
#Data source to get all availablity zones
data "aws_availability_zones" "available_zones" {
  
}
#Create 4-Private-subnets and 2 public subnets

#Web-Tier-Subnet public
resource "aws_subnet" "Web_tier-Subnet-1-Pub" {
  vpc_id = aws_vpc.Three-Tier-VPC-Resource.id
  cidr_block = var.Web-Tier-1a-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name="Web-Tier-Subnet-1a-Pub"
  }
}
#Web-Tier-Subnet public
resource "aws_subnet" "Web_tier-Subnet-2-Pub" {
  vpc_id = aws_vpc.Three-Tier-VPC-Resource.id
  cidr_block = var.Web-Tier-1b-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name="Web-Tier-Subnet-1b-Pub"
  }
}
#App-Tier-Subnet
resource "aws_subnet" "App_tier-Subnet-1-Private" {
  vpc_id = aws_vpc.Three-Tier-VPC-Resource.id
  cidr_block = var.App-Tier-1a-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false
  tags = {
    Name="App-Tier-Subnet-1a-Pri"
  }
}
#App-Tier-Subnet

resource "aws_subnet" "App_tier-Subnet-2-Private" {
  vpc_id = aws_vpc.Three-Tier-VPC-Resource.id
  cidr_block = var.App-Tier-1b-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false
  tags = {
    Name="App-Tier-Subnet-1b-Pri"
  }
}
#DB-Tier-Subnet
resource "aws_subnet" "DB_tier-Subnet-1-Private" {
  vpc_id = aws_vpc.Three-Tier-VPC-Resource.id
  cidr_block = var.DB-Tier-1a-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false
  tags = {
    Name="DB-Tier-Subnet-1a-Pri"
  }
}
#DB-Tier-Subnet

resource "aws_subnet" "DB_tier-Subnet-2-Private" {
  vpc_id = aws_vpc.Three-Tier-VPC-Resource.id
  cidr_block = var.DB-Tier-1b-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false
  tags = {
    Name="DB-Tier-Subnet-1b-Pri"
  }
}

#Assign public subnets to public route table
resource "aws_route_table_association" "Web_tier-Subnet-1-Pub-RTA" {
  subnet_id = aws_subnet.Web_tier-Subnet-1-Pub.id
  route_table_id = aws_route_table.Three-Tier-Public-RT-Resource.id
}
resource "aws_route_table_association" "Web_tier-Subnet-2-Pub-RTA" {
  subnet_id = aws_subnet.Web_tier-Subnet-2-Pub.id
  route_table_id = aws_route_table.Three-Tier-Public-RT-Resource.id
}
