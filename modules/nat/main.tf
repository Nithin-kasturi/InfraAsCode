#Elastic IP for Web_Tier_1
resource "aws_eip" "EIP_for_NAT1" {
  vpc = true
}
#NAT gateway for Web_Tier_1
resource "aws_nat_gateway" "NAT_for_Web_Tier_1" {
  subnet_id = var.Web_Tier_Subnet1_id
  allocation_id = aws_eip.EIP_for_NAT1.id
  tags = {
    Name = "NAT_for_Web_Tier_1"
  }

}
#Route table for NAT_for_Web_Tier_1
resource "aws_route_table" "RT_for_Web_Tier_1" {
  vpc_id = var.vpc_id
  route{
    cidr_block ="0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT_for_Web_Tier_1.id
  }
  tags = {
    Name="RT_for_Web_Tier_1"
  }
}
#Route table association of RT_for_Web_Tier_1
resource "aws_route_table_association" "RTA_for_RT_Web_Tier_1" {
  subnet_id = var.App_Tier_Subnet1_id
  route_table_id = aws_route_table.RT_for_Web_Tier_1.id
}
#Elastic IP for Web_Tier_2
resource "aws_eip" "EIP_for_NAT2" {
  vpc = true
}
#NAT gateway for Web_Tier_1
resource "aws_nat_gateway" "NAT_for_Web_Tier_2" {
  subnet_id = var.Web_Tier_Subnet2_id
  allocation_id = aws_eip.EIP_for_NAT2.id
  tags = {
    Name = "NAT_for_Web_Tier_2"
  }

}
#Route table for NAT_for_Web_Tier_2
resource "aws_route_table" "RT_for_Web_Tier_2" {
  vpc_id = var.vpc_id
  route{
    cidr_block ="0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT_for_Web_Tier_2.id
  }
  tags = {
    Name="RT_for_Web_Tier_2"
  }
}
#Route table association of RT_for_Web_Tier_1
resource "aws_route_table_association" "RTA_for_RT_Web_Tier_2" {
  subnet_id = var.App_Tier_Subnet2_id
  route_table_id = aws_route_table.RT_for_Web_Tier_2.id
}