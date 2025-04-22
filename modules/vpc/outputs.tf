output "region" {
  value = var.region
}
output "Project_Name" {
  value = var.Project_Name
}
output "vpc_id" {
  value = aws_vpc.Three-Tier-VPC-Resource.id
}
output "Web_tier_Subnet1_id" {
  value = aws_subnet.Web_tier-Subnet-1-Pub.id
}
output "App_Tier_Subnet1_id" {
  value = aws_subnet.App_tier-Subnet-1-Private.id
}
output "Web_tier_Subnet2_id" {
  value = aws_subnet.Web_tier-Subnet-2-Pub.id
}
output "App_Tier_Subnet2_id" {
  value = aws_subnet.App_tier-Subnet-2-Private.id
}