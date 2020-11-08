terraform {
  required_version = ">= 0.13.5"
}

provider "aws" {
  version = ">= 3.5.0"
  //  region  = "REGION"
  region = "us-east-2"
}

# parameter settings
locals {
  pj        = "PJ"
  vpc_cidr  = "10.1.0.0/16"
  env       = "ENV"
  base_name = "${local.pj}-${local.env}"
  tags = {
    pj    = "PJ"
    env   = "ENV"
    owner = "OWNER"
  }

  subnet_public_cidrs  = ["10.1.10.0/24", "10.1.11.0/24"]
  subnet_private_cidrs = ["10.1.20.0/24", "10.1.21.0/24"]
}

module "network" {
  source = "../modules/network"

  # common parameter
  tags      = local.tags
  base_name = local.base_name

  # module parameter
  vpc_cidr             = local.vpc_cidr
  subnet_public_cidrs  = local.subnet_public_cidrs
  subnet_private_cidrs = local.subnet_private_cidrs
}

module "kms" {
  source = "../modules/kms"

  # common parameter
  tags      = local.tags
  base_name = local.base_name
}

module "efs" {
  source = "../modules/efs"

  # common parameter
  tags      = local.tags
  base_name = local.base_name

  # module parameter
  kms_id              = module.kms.kms_arn
  private_subent_id_0 = module.network.private_subent_ids[0]
  private_subent_id_1 = module.network.private_subent_ids[1]
  vpc_id              = module.network.vpc_id
  vpc_cidr            = local.vpc_cidr
}
