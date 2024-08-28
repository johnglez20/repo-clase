resource "aws_instance" "instancia_proyecto" {
    ami = "ami-04a81a99f5ec58529"
    instance_type = "t2.micro"
    key_name = "key_ubuntu"
    associate_public_ip_address = true
    subnet_id = aws_subnet.subnet1_proyecto.id
    vpc_security_group_ids = [aws_security_group.sg_proyecto.id]


    tags = {

        Name= "instancia_proyecto_final"

    }
  
}