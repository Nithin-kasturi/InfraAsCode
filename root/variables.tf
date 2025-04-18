variable "region" {
  type = string
  default = "us-east-1"
}
variable "Project_Name" {
  type = string
  default = "Three-Tier-VPC"
}
variable "Web-Tier-1a-cidr" {
  type = string
  default = ""
}
variable "Web-Tier-1b-cidr" {
  type = string
}
variable "App-Tier-1a-cidr" {
  type = string
}
variable "App-Tier-1b-cidr" {
  type = string
}
variable "DB-Tier-1a-cidr" {
  type = string
}
variable "DB-Tier-1b-cidr" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "Web_Tier_Subnet1_id" {
  type = string
}
variable "App_Tier_Subnet1_id" {
  type = string
}
variable "Web_Tier_Subnet2_id" {
  type = string
}
variable "App_Tier_Subnet2_id" {
  type = string
}