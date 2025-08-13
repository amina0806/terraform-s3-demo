
provider "aws" {
  region = "us-east-1"
}

resource "random_string" "sfx" {
  length  = 5
  upper   = false
  special = false
}

resource "aws_s3_bucket" "demo" {
  bucket = "amina-tf-demo-${random_string.sfx.id}"
  tags = {
    Name        = "Terraform Demo Bucket"
    Environment = "Demo"
  }
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.demo.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.demo.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}