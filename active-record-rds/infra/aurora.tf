data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

module "db" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 2.0"

  name = "eval-activerecord-connection"

  engine         = "aurora-mysql"
  engine_version = "1.19.5"

  vpc_id  = data.aws_vpc.default.id
  subnets = data.aws_subnet_ids.all.ids

  replica_count = 1
  # allowed_security_groups         = ["sg-12345678"]
  allowed_cidr_blocks = ["10.20.0.0/20"]
  instance_type       = "db.t2.medium"
  storage_encrypted   = true
  apply_immediately   = true
  monitoring_interval = 10

  db_parameter_group_name         = "default.aurora-mysql5.6"
  db_cluster_parameter_group_name = "default.aurora-mysql5.6"

  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]

  tags = {
    Environment = "eval"
    Terraform   = "true"
  }
}
