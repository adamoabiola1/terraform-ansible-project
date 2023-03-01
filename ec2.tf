resource "aws_instance" "EC2" {
  ami             = "ami-0778521d914d23bc1" # us-east-1
  instance_type   = "t2.micro"
  count           = 4
  key_name        = "Mini-key"
  security_groups = [aws_security_group.TF_SG.name]

  tags = {
    Name = "terraform-server"
  }
}

#provision alternative
resource "aws_instance" "first" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  security_groups             = ["${aws_security_group.terraform-sg.id}"]
  key_name                    = "Mini-key"
  subnet_id                   = "subnet-0cb7063e7ec1ded96"
  associate_public_ip_address = "true"
  tags = {
    Name   = "first-server"
    source = "terraform"
  }
}

resource "aws_instance" "second" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.terraform-sg.id}"]
  key_name                    = "Mini-key"
  subnet_id                   = "subnet-0cb7063e7ec1ded96"
  associate_public_ip_address = "true"
  # user_data              = <<-EOF

  #!/bin/bash
  #sudo su -
  #sudo apt update -y
  #sudo apt-get install apache 2 -y
  #sudo systemctl start apache 2
  #sudo systemctl enable apache 2
  #sudo bash -c "echo hello cloud" > /var/www/html/index.html
  #EOF

  tags = {
    Name   = "second-server"
    source = "terraform"
  }
}

resource "aws_instance" "third" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.terraform-sg.id}"]
  key_name                    = "Mini-key"
  subnet_id                   = "subnet-0cb7063e7ec1ded96"
  associate_public_ip_address = "true"
  tags = {
    Name   = "third-server"
    source = "terraform"
  }
}
 
resource "aws_instance" "host" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.terraform-sg.id}"]
  key_name                    = "Mini-key"
  subnet_id                   = "subnet-0cb7063e7ec1ded96"
  associate_public_ip_address = "true"
  tags = {
    Name   = "host-server"
    source = "terraform"
  }
}
 