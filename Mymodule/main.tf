resource "aws_instance" "my_instance" {
  ami           = "ami-00b3a24a63f1aa01d"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  key_name      = var.key_pair
  subnet_id     = var.subnet_id

  tags = {
    Name = "MyInstance"
  }
}

# main.tf in the main configuration directory