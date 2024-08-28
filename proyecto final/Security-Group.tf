resource "aws_security_group" "sg_proyecto" {
    name = "SG Acceso SSH"
    description = "permite el acceso ssh desde cualquier lugar"
    vpc_id = aws_vpc.vpc_proyecto.id

    tags = {
      Name = "SG_proyecto_final"
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "permite acceso al puerto 22"
    }
  
  ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "permite acceso al puerto 80"
    }


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "permite salida a cualquier ip y puerto"

    }
}

resource "aws_security_group" "rds" {
    name = "Acceso postgres"
    vpc_id = aws_vpc.vpc_proyecto.id

    tags = {
      Name = "postgres_proyecto_final"
    }

    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

}