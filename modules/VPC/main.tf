resource "aws_vpc" "vpc" {
  cidr_block         = var.rds_vpc_cidr
}

resource "aws_internet_gateway" "igw" {
  vpc_id             = aws_vpc.vpc.id
}

data "aws_availability_zones" "available_zones" {}

resource "aws_subnet" "subnet_az1" {
  vpc_id             = aws_vpc.vpc.id
  cidr_block = var.subnet_az1_cidr
  availability_zone  = data.aws_availability_zones.available_zones.names[0]
}

resource "aws_subnet" "subnet_az2" {
  vpc_id             = aws_vpc.vpc.id
  cidr_block         = var.subnet_az2_cidr
  availability_zone  = data.aws_availability_zones.available_zones.names[1]
}

resource "aws_security_group" "rds_security_group" {
  name               = var.rds_sg_name
  description        = "Allow MySQL access on port 3306"
  vpc_id             = aws_vpc.vpc.id

  ingress {
    description      = "MySQL Access"
    from_port        = var.rds_ingress_port
    to_port          = var.rds_ingress_port
    protocol         = var.rds_ingress_protocol
    cidr_blocks      = var.rds_sg_cidr
  }

  egress {
    from_port        = var.rds_egress_port
    to_port          = var.rds_egress_port
    protocol         = var.rds_egress_protocol
    cidr_blocks      = var.rds_sg_cidr
  }

}