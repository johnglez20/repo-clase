resource "aws_vpc" "vpc_proyecto" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "VPC_proyecto_final"
    }
  
}

resource "aws_subnet" "subnet1_proyecto" {
    vpc_id = aws_vpc.vpc_proyecto.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"


    tags = {
       Name = "subnet1_proyecto_final"
    }
  
}

resource "aws_subnet" "subnet2_proyecto" {
    vpc_id = aws_vpc.vpc_proyecto.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1a"


    tags = {
       Name = "subnet2_proyecto_final"
    }
  
}

resource "aws_subnet" "subnet3_proyecto" {
    vpc_id = aws_vpc.vpc_proyecto.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1b"


    tags = {
       Name = "subnet3_proyecto_final"
    }
  
}

resource "aws_subnet" "subnet4_proyecto" {
    vpc_id = aws_vpc.vpc_proyecto.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-east-1b"


    tags = {
       Name = "subnet4_proyecto_final"
    }
  
}

resource "aws_internet_gateway" "gw_proyecto" {
    vpc_id = aws_vpc.vpc_proyecto.id

    tags = {
      Name = "GW_proyecto_final"
    }
  
}

resource "aws_route_table" "rt_proyecto" {
    vpc_id = aws_vpc.vpc_proyecto.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw_proyecto.id
    }

    tags = {

       Name = "rt_proyecto_final"
    }
  
}

resource "aws_route_table_association" "a_rt_proyecto" {
    subnet_id = aws_subnet.subnet1_proyecto.id
    route_table_id = aws_route_table.rt_proyecto.id
  
}