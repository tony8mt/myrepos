provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/tony/.aws/credentials"
        profile = "default"
}

resource "aws_instance" "web" {
        instance_type = "t2.micro",
        ami = "ami-8536d6e7",
        vpc_security_group_ids = ["${aws_security_group.web_sg.id}"],
        count = 2

}

resource "aws_security_group" "web_sg" {
        name = "web_sg",
        ingress {
                from_port   = 80
                to_port     = 80
                protocol    = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                }
        ingress {
                from_port   = 22
                to_port     = 22
                protocol    = "tcp"
                cidr_blocks = ["0.0.0.0/16"]
                }

}

