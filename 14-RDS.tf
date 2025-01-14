resource "aws_db_subnet_group" "rds_subnet_group" {
  provider = aws.tokyo
  name       = "my-db-subnet-group"
  subnet_ids = [aws_subnet.tokyo_subnet_private_1a.id, aws_subnet.tokyo_subnet_private_1c.id ]  #if multi AZ add another subnet
}


resource "aws_db_instance" "my_db_instance" {
  provider = aws.tokyo
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "dbdatabase"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

    # Attach the DB security group
  vpc_security_group_ids = [aws_security_group.tokyo_sg.id]  
    tags = {
        Name = "ec2_to_mysql_rds"
    }
}


output "rds-endpoint" {
    value = aws_db_instance.my_db_instance.endpoint
}

output "ec2-publicip"{
    value = aws_instance.ec2.public_ip
}