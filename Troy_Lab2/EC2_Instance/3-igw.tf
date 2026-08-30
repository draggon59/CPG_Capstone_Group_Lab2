resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name    = "CPG_Lab2_IGW"
    Service = "application1"
    Owner   = "Luke"
    Planet  = "Musafar"
  }
}


# For public subnets