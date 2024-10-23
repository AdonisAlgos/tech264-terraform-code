provider "aws" {
  region = "eu-west-1" # Specify your desired AWS region
}

resource "aws_security_group" "tech264_adonis_tf_allow_port_22_3000_80" {

  # Allow port 22 (SSH) from localhost (127.0.0.1)
  ingress {
    description      = "Allow SSH from localhost"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Allow port 3000 from all (0.0.0.0/0)
  ingress {
    description      = "Allow access to port 3000 from all"
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  # Allow port 80 (HTTP) from all (0.0.0.0/0)
  ingress {
    description      = "Allow access to port 80 from all"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tech264-adonis-tf-allow-port-22-3000-80"
  }
}
