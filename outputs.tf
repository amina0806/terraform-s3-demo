output "bucket_name" {
  value       = aws_s3_bucket.demo.bucket
  description = "Name of the created S3 bucket"
}