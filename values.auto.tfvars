region = "us-east-1"

############## S3 ################
bucket_name = "unique-bucket-tf"

############## VPC ###############
rds_vpc_cidr = "10.0.0.0/16"
subnet_az1_cidr = "10.0.0.0/24"
subnet_az2_cidr = "10.0.1.0/24"
rds_sg_name = "rds_security_group"
rds_sg_cidr = ["0.0.0.0/0"]
rds_ingress_port = 3306
rds_ingress_protocol = "tcp"
rds_egress_port = 0
rds_egress_protocol = "-1"

############## RDS ###############
rds_subnet_group_name = "rds_subnet_groups"
rds_engine = "mysql"
rds_name = "rds_tf"
rds_engine_version = "8.0.33"
rds_instance_class = "db.t2.micro"
rds_user = "islam"
rds_pass = "islam123"
rds_storage = 5
rds_param_group = "default.mysql8.0"
