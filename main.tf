provider "aws" {
  region                  = var.region
}

module "s3" {
  source                  = "./modules/S3"
  bucket_name             = var.bucket_name
}

module "vpc" {
  source                  = "./modules/VPC"
  rds_vpc_cidr            = var.rds_vpc_cidr
  subnet_az1_cidr         = var.subnet_az1_cidr
  subnet_az2_cidr         = var.subnet_az2_cidr
  rds_sg_name             = var.rds_sg_name
  rds_ingress_port        = var.rds_ingress_port
  rds_ingress_protocol    = var.rds_ingress_protocol
  rds_egress_port         = var.rds_egress_port
  rds_egress_protocol     = var.rds_egress_protocol
  rds_sg_cidr             = var.rds_sg_cidr
}

module "rds" {
  source                  = "./modules/RDS"
  rds_subnet_group_name   = var.rds_subnet_group_name
  subnet_az1_id           = module.vpc.rds_subnet_az1_id
  subnet_az2_id           = module.vpc.rds_subnet_az2_id
  rds_storage             = var.rds_storage
  rds_name                = var.rds_name
  rds_engine              = var.rds_engine
  rds_engine_version      = var.rds_engine_version
  rds_instance_class      = var.rds_instance_class
  rds_user                = var.rds_user
  rds_pass                = var.rds_pass
  rds_security_group_id   = module.vpc.rds_security_group_id
  rds_param_group         = var.rds_param_group
}