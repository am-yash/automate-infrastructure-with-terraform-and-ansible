# key pair

resource "aws_key_pair" "my_key_new" {
    key_name = "${var.env}-infra-app-key"
    public_key = file("terra-key-ec2.pub")

    tags = {
        Environment = var.env
    }

}

#VPC and Security Group

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
    name = "${var.env}-infra-app-sg"
    description = "this will add tf genrated security group"
    vpc_id = aws_default_vpc.default.id

    #inbound rules
    ingress   {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "this is for ssh open"

    }

    ingress   {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "this is for HTTP open"

    }


    # outbound rule

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all access open outbound rule"

    }

    tags = {
        Name = "${var.env}-infra-app-sg"
    }


    
}


#ec2 instance     

resource "aws_instance" "my_instance"{
    count = var.instance_count
    depends_on = [ aws_security_group.my_security_group,aws_key_pair.my_key_new ]
    key_name = aws_key_pair.my_key_new.key_name
    vpc_security_group_ids = [aws_security_group.my_security_group.id]
    instance_type = var.instance_type
    ami = var.ec2_ami_id

    root_block_device {
        volume_size = var.env == "prd" ? 20 : 10
        volume_type = "gp3"
    }
     
     tags = {
        Name = "${var.env}-infra-app-instance"
        Environment = var.env
     }
}
