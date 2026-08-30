#resource "aws_eip" "nat" {

#  tags = {
#    Name = "nat"
#  }
#}


# NAT Gateway
# Allows resources in private subnets to reach the internet
# but prevents the internet from initiating connections to them

#resource "aws_nat_gateway" "nat" {
#  allocation_id = aws_eip.nat.id
#  subnet_id     = aws_subnet.public-us-west-2a.id


#  tags = {
#    Name = "terraform-nat-gw"
#  }

#  depends_on = [aws_internet_gateway.igw]
#}