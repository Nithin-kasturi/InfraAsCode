provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "codebucket" {
  bucket = "codebucket-950286"
  tags = {
    Name = "codebucket-950286"
  }
}
