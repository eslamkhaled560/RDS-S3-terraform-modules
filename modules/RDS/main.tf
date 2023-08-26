resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = var.rds_subnet_group_name
  subnet_ids  = [var.subnet_az1_id, var.subnet_az2_id]
  description = "RDS instance subnets"
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.rds_storage
  db_name                = var.rds_name
  engine                 = var.rds_engine
  engine_version         = var.rds_engine_version
  instance_class         = var.rds_instance_class
  username               = var.rds_user
  password               = var.rds_pass
  vpc_security_group_ids = [var.rds_security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  parameter_group_name   = var.rds_param_group
  skip_final_snapshot    = true
}