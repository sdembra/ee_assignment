
#security group for ecs instances confirm port numbers
resource "aws_security_group" "ee-jenkins-instance" {
  name        = "jenkins"
  description = "Allows incoming traffic from public and private alb"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
#keeping port 22 open temporarily as we do not know the public IP form where we need to open the access.
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port  = "8080"
    to_port    = "8080"
    protocol   = "tcp"
    cidr_blocks= ["0.0.0.0/0"]
#keeping port 8080 open temporarily as we do not know the public IP form where we need to open the access.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "${var.env}-${var.tenant}-jenkins"
  }
}

output "ee-jenkins" {
  value = "${aws_security_group.ee-jenkins-instance.id}"
}

