output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subent_ids" {
  value = module.network.public_subent_ids
}

output "private_subent_ids" {
  value = module.network.private_subent_ids
}

output "kms_arn" {
  value = module.kms.kms_arn
}

output "efs_id" {
  value = module.efs.efs_id
}