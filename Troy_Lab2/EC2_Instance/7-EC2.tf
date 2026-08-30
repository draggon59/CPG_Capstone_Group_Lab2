resource "aws_instance" "web_server" {
  ami                         = "ami-06d455b8b50b0de4d"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  # key_name = 
  vpc_security_group_ids = [aws_security_group.ping.id, aws_security_group.web_server.id]
  subnet_id              = aws_subnet.public-us-west-2a.id

  user_data = file("user_data_script.sh")

  tags = {
    Name = "web-server"
  }
}