output "s3_bucket_name" {
  value       = aws_s3_bucket.project_bucket.bucket
  sensitive   = true
  description = "value of the S3 bucket name created by this module"
}

output "sensitive_var" {
  value       = var.my_sensitive_value
  sensitive   = true
  description = "A sensitive value that should not be logged or displayed in the console."
}
