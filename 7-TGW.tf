###### japan ######################

resource "aws_ec2_transit_gateway" "tokyo_transit" {
  provider = aws.tokyo

description = "tg-web-backend-database"
  tags = {
    Name = "Web-Backend-Database Transit Gateway"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tokyo_tga_public" {
  provider = aws.tokyo
  subnet_ids         = [aws_subnet.tokyo_subnet_public_1a.id]
  transit_gateway_id = aws_ec2_transit_gateway.tokyo_transit.id
  vpc_id             = aws_vpc.tokyo_vpc.id 
}


# ###### virginia  #############################################################################

resource "aws_ec2_transit_gateway" "virginia_transit" {
  provider = aws.virginia

description = "tg-web-backend-database"
  tags = {
    Name = "Web-Backend-Database Transit Gateway"
  }
}



resource "aws_ec2_transit_gateway_vpc_attachment" "virginia_public_1a" {
  provider = aws.virginia
  subnet_ids         = [aws_subnet.virginia_subnet_public_1a.id, aws_subnet.virginia_subnet_public_1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.virginia_transit.id
  vpc_id             = aws_vpc.virginia_vpc.id
}

resource "aws_ec2_transit_gateway" "london_transit" {
  provider = aws.london

description = "tg-web-backend-database"
  tags = {
    Name = "Web-Backend-Database Transit Gateway"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "public-eu-west-2a" {
  provider = aws.london
  subnet_ids         = [aws_subnet.london_subnet_public_1a.id, aws_subnet.london_subnet_public_1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.london_transit.id
  vpc_id             = aws_vpc.london_vpc.id
}

