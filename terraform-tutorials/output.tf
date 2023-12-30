
output "public_ip" {
  value       = aws_instance.my_vm.public_ip
  description = "Public IP Address of EC2 instance"
}

output "instance_id" {
  value       = aws_instance.my_vm.id
  description = "Instance ID"
}

# output "bucket_name" {
#   value = aws_s3_bucket.rds_s3_bucket.bucket
# }
