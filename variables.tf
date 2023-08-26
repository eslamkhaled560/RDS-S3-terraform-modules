variable "region" {}

#####################################
################# S3 ################
#####################################
variable "bucket_name" {}

#####################################
################# VPC ###############
#####################################
variable "rds_vpc_cidr" {}

variable "subnet_az1_cidr" {}

variable "subnet_az2_cidr" {}

variable "rds_sg_name" {}

variable "rds_sg_cidr" {}

variable "rds_ingress_port" {}

variable "rds_ingress_protocol" {}

variable "rds_egress_port" {}

variable "rds_egress_protocol" {}

#####################################
################ RDS ################
#####################################
variable "rds_subnet_group_name" {}

variable "rds_engine" {}

variable "rds_name" {}

variable "rds_engine_version" {}

variable "rds_instance_class" {}

variable "rds_user" {}

variable "rds_pass" {}

variable "rds_storage" {}

variable "rds_param_group" {}