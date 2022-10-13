resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_main"
  subnet_ids = [aws_subnet.main_1.id, aws_subnet.main_2.id, aws_subnet.main_3.id, aws_subnet.main_4.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  db_name              = "gachon2022"
  identifier           = "gachon-2022"
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.DB_USER
  password             = var.DB_PW
  publicly_accessible  = true
  skip_final_snapshot  = true
  vpc_security_group_ids   = [aws_security_group.allow_db.id]

}