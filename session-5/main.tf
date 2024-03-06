resource "aws_db_instance" "default" {
  allocated_storage         = 10
  identifier                = replace(local.name, "rtype", "rds") // Name of RDS Instance - AWS Resource Name
  db_name                   = "mydb"                              // Name of the database in your RDS Instance - MySQL Database Name
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t3.micro"
  username                  = "admin"
  password                  = random_password.db_password.result
  parameter_group_name      = "default.mysql5.7"
  tags                      = local.common_tags
  skip_final_snapshot       = var.env != "prod" ? true : false # if false, final_snapshot_identifier is required
  final_snapshot_identifier = var.env != "prod" ? null : "${var.env}-final-snapshot"
}

# Problem Statement:
# If environments are dev, qa, stage, I do not want to create skip_final_snapshot
# If environment is prod, I want to create skip_final_snapshot

resource "random_password" "db_password" {
  length           = 20
  special          = true
  override_special = "%"
}

# Equality Operators
# a == b returns true if a and b both have the same type and the same value, or false otherwise.

# cars == cars > true
# cars == bus > false

# Conditional Expressions:

# Syntax: 

# condition ? true_val : false_val
# condition ? first_value (when condition is true) : second_value (when condition is false)

# Example:
# condition ? good : not good

# cars == cars ? good : not good
# >> good

# cars != bus ? good : not good
# >> good

# cars == bus ? not good : good
# >> good


# AWS Systems Manager - Parameter Store: store secret values
# AWS Secrets Manager - Industry Standard