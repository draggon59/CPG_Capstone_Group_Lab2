
# static default route in private route table
# default traffic from private subnets will come to NAT gateway

#resource "aws_route_table" "private" {
#  vpc_id = aws_vpc.main.id

#  route {
#      cidr_block = "0.0.0.0/0"
#      nat_gateway_id = aws_nat_gateway.nat.id
   
#    }
  

#  tags = {
#    Name = "terraform-private-rtb"
#  }
#}



# Associate existing private subnet with NAT gatewway

#resource "aws_route_table_association" "private-us-west-2a" {
#  subnet_id      = aws_subnet.private-us-west-2a.id
#  route_table_id = aws_route_table.private.id
#}

#resource "aws_route_table_association" "private-us-west-2b" {
#  subnet_id      = aws_subnet.private-us-west-2b.id
#  route_table_id = aws_route_table.private.id
#}

#resource "aws_route_table_association" "private-us-west-2c" {
#  subnet_id      = aws_subnet.private-us-west-2c.id
#  route_table_id = aws_route_table.private.id
#}


########################## Public rtb ##########################


# static default route in public route table
# default traffic from public subnets will come to Internet gateway (IGW)

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id

    }

  tags = {
    Name = "terraform-public-rtb"
  }
}

# Associate existing public subnet with Internet gatewway (IGW)

resource "aws_route_table_association" "public-us-west-2a" {
  subnet_id      = aws_subnet.public-us-west-2a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-west-2b" {
  subnet_id      = aws_subnet.public-us-west-2b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-west-2c" {
  subnet_id      = aws_subnet.public-us-west-2c.id
  route_table_id = aws_route_table.public.id
}