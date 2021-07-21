resource "aws_security_group" "public_alb" {
  name        = "public-alb"
  description = "Allow HTTPS inbound traffic"
  vpc_id      = module.main_vpc.vpc_id

  ingress {
    description      = "HTTPS from Internet"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "private_ec2_primary" {
  name        = "private-ec2-primary"
  description = "Allow HTTP inbound traffic"
  vpc_id      = module.main_vpc.vpc_id

  ingress {
    description      = "HTTP from ALB"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.public_alb.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "private_ec2_secondary" {
  name        = "public-ec2-secondary"
  description = "Allow HTTPS outbound traffic"
  vpc_id      = module.main_vpc.vpc_id


  egress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}