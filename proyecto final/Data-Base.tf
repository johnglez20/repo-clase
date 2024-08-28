resource "aws_db_instance" "db-proyecto" {
    engine = "postgres"
    engine_version = "16.3"
    allocated_storage = 20
    storage_type = "gp2"
    identifier = "mydb-proyecto"
    username = "bootcamp"
    password = "bogota2024"
    port = 5432
    db_name = "proyectof"
    instance_class = "db.t3.micro"
    multi_az = false
    skip_final_snapshot = true
    db_subnet_group_name = aws_db_subnet_group.datasubnet.id
    vpc_security_group_ids = [ aws_security_group.rds.id ]
    availability_zone = "us-east-1a"

    tags = {
      Name = "mydb_proyecto_final"
    }
  
}

resource "aws_db_subnet_group" "datasubnet" {
  name = "subnet-database"
  subnet_ids = [aws_subnet.subnet2_proyecto.id, aws_subnet.subnet3_proyecto.id]

  tags = {
    Name = "subnet-database"
  }
}

