resource "aws_s3_bucket" "bucket_for_code" {
  bucket = "bucket-for-code"
  tags = {
    Name = "bucket-for-code"
  }
}
