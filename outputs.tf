output "vm_aws_ip" {
  description = "IP da máquina virtual criada na AWS"
  value       = aws_instance.vm-actions.public_ip
}

output "s3_arn" {
  description = "ARN do bucket"
  value       = aws_s3_bucket.exemplo_s3.arn
}

output "sg_vm_id" {
  description = "ID do security group"
  value       = aws_security_group.sg-teste-actions.id
}