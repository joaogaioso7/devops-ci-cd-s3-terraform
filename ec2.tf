resource "aws_key_pair" "key-actions" {
  key_name   = "aws-teste-actions"
  public_key = file("./aws-teste-actions.pub")
}

resource "aws_security_group" "sg-teste-actions" {
  name = "teste-actions-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "vm-actions" {
  ami                         = "ami-00ca32bbc84273381"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.key-actions.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg-teste-actions.id]
  tags = {
    Name = "vm-terraform-actions"
  }
}