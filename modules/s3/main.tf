resource "aws_s3_bucket" "Bucket_for_code" {
  bucket = "Bucket_for_code"
  tags={
    Name="Bucket_for_code"
  }
}