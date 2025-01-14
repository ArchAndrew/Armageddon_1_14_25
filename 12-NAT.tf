resource "aws_eip" "nat_tokyo_1a" {
  provider = aws.tokyo
  tags = {
    Name = "nat_tokyo_1a"
  }
}

resource "aws_eip" "nat_osaka_3a" {
  provider = aws.osaka
  tags = {
    Name = "nat_osaka_3a"
  }
}

resource "aws_eip" "nat_virginia_1a" {
  provider = aws.virginia
  tags = {
    Name = "nat_virginia_1a"
  }
}

resource "aws_eip" "nat_virginia_1b" {
  provider = aws.virginia
  tags = {
    Name = "nat_virginia_1b"
  }
}

resource "aws_eip" "nat_hong_kong_1a" {
  provider = aws.hong-kong
  tags = {
    Name = "nat_hong-kong_1a"
  }
}

resource "aws_eip" "nat_hong_kong_1b" {
  provider = aws.hong-kong
  tags = {
    Name = "nat_hong Kong_1b"
  }
}

resource "aws_eip" "nat_australia_1a" {
  provider = aws.australia
  tags = {
    Name = "nat_australia_1a"
  }
}

resource "aws_eip" "nat_australia_1b" {
  provider = aws.australia
  tags = {
    Name = "nat_australia_1b"
  }
}

resource "aws_eip" "nat_california_1b" {
  provider = aws.california
  tags = {
    Name = "nat_california_1b"
  }
}

resource "aws_eip" "nat_california_1c" {
  provider = aws.california
  tags = {
    Name = "nat_california_1c"
  }
}

resource "aws_eip" "nat_london_1a" {
  provider = aws.london
  tags = {
    Name = "nat_london_1a"
  }
}

resource "aws_eip" "nat_london_1b" {
  provider = aws.london
  tags = {
    Name = "nat_london_1b"
  }
}

resource "aws_eip" "nat_sao_paulo_1a" {
  provider = aws.sao-paulo
  tags = {
    Name = "nat_sao_paulo"
  }
}

resource "aws_eip" "nat_sao_paulo_1c" {
  provider = aws.sao-paulo
  tags = {
    Name = "nat_sao_paulo"
  }
}

#List of NAT Gateways for each Region

#Nat Gateway for Tokyo

resource "aws_nat_gateway" "nat_gateway_public_tokyo_1a" {
  provider = aws.tokyo
  allocation_id = aws_eip.nat_tokyo_1a.id
  subnet_id     = aws_subnet.tokyo_subnet_public_1a.id

  tags = {
    Name = "nat_tokyo_1a"
  }

  depends_on = [aws_internet_gateway.tokyo_igw]
}

#Nat Gateway for Osaka
resource "aws_nat_gateway" "nat_gateway_public_osaka_3a" {
  provider = aws.osaka
  allocation_id = aws_eip.nat_osaka_3a.id
  subnet_id     = aws_subnet.osaka_subnet_public_3a.id 

  tags = {
    Name = "nat_osaka_3a"
  }

  depends_on = [aws_internet_gateway.osaka_igw]
}


#Nat Gateway for Virginia

resource "aws_nat_gateway" "nat_gateway_virginia_1a" {
  provider = aws.virginia
  allocation_id = aws_eip.nat_virginia_1a.id
  subnet_id     = aws_subnet.virginia_subnet_public_1a.id

  tags = {
    Name = "nat_virginia_1a"
  }

  depends_on = [aws_internet_gateway.virginia_igw]
}

resource "aws_nat_gateway" "nat_gateway_virginia_1b" {
  provider = aws.virginia
  allocation_id = aws_eip.nat_virginia_1b.id
  subnet_id     = aws_subnet.virginia_subnet_public_1b.id

  tags = {
    Name = "nat_virginia_1b"
  }

  depends_on = [aws_internet_gateway.virginia_igw]
}

#Nat Gateway for Hong Kong

resource "aws_nat_gateway" "nat_gateway_hong_kong_1a" {
  provider = aws.hong-kong
  allocation_id = aws_eip.nat_hong_kong_1a.id
  subnet_id     = aws_subnet.hong_kong_subnet_public_1a.id

  tags = {
    Name = "nat_hong_kong_1a"
  }

  depends_on = [aws_internet_gateway.hong_kong_igw]
}

resource "aws_nat_gateway" "nat_gateway_hong_kong_1b" {
  provider = aws.hong-kong
  allocation_id = aws_eip.nat_hong_kong_1b.id
  subnet_id     = aws_subnet.hong_kong_subnet_public_1b.id

  tags = {
    Name = "nat_hong_kong_1b"
  }

  depends_on = [aws_internet_gateway.hong_kong_igw]
}

#Nat Gateway for Australia

resource "aws_nat_gateway" "nat_gateway_australia_1a" {
  provider = aws.australia
  allocation_id = aws_eip.nat_australia_1a.id
  subnet_id     = aws_subnet.australia_subnet_public_1a.id

  tags = {
    Name = "nat_australia"
  }

  depends_on = [aws_internet_gateway.australia_igw]
}

resource "aws_nat_gateway" "nat_gateway_australia__1b" {
  provider = aws.australia
  allocation_id = aws_eip.nat_australia_1b.id
  subnet_id     = aws_subnet.australia_subnet_public_1b.id

  tags = {
    Name = "nat_australia2"
  }

  depends_on = [aws_internet_gateway.australia_igw]
}

#Nat Gateway for California

resource "aws_nat_gateway" "nat_gateway_california_1b" {
  provider = aws.california
  allocation_id = aws_eip.nat_california_1b.id
  subnet_id     = aws_subnet.california_subnet_public_1a.id

  tags = {
    Name = "nat_california"
  }

  depends_on = [aws_internet_gateway.california_igw]
}

resource "aws_nat_gateway" "nat_gateway_california_1c" {
  provider = aws.california
  allocation_id = aws_eip.nat_california_1c.id
  subnet_id     = aws_subnet.california_subnet_public_1c.id

  tags = {
    Name = "nat_california2"
  }

  depends_on = [aws_internet_gateway.california_igw]
}

#Nat Gateway for London

resource "aws_nat_gateway" "nat_gateway_london_1a" {
  provider = aws.london
  allocation_id = aws_eip.nat_london_1a.id
  subnet_id     = aws_subnet.london_subnet_public_1a.id

  tags = {
    Name = "nat_london"
  }

  depends_on = [aws_internet_gateway.london_igw]
}

resource "aws_nat_gateway" "nat_gateway_london_1b" {
  provider = aws.london
  allocation_id = aws_eip.nat_london_1b.id
  subnet_id     = aws_subnet.london_subnet_public_1b.id

  tags = {
    Name = "nat_london2"
  }

  depends_on = [aws_internet_gateway.london_igw]
}

#Nat Gateway for Sao Paulo

resource "aws_nat_gateway" "nat_gateway_sao_paulo_1a" {
  provider = aws.sao-paulo
  allocation_id = aws_eip.nat_sao_paulo_1a.id
  subnet_id     = aws_subnet.sao_paulo_subnet_public_1a.id

  tags = {
    Name = "nat_sao_paulo_1a"
  }

  depends_on = [aws_internet_gateway.sao_paulo_igw]
}

resource "aws_nat_gateway" "nat_gateway_sao_paulo_1c" {
  provider = aws.sao-paulo
  allocation_id = aws_eip.nat_sao_paulo_1c.id
  subnet_id     = aws_subnet.sao_paulo_subnet_public_1c.id

  tags = {
    Name = "nat_sao_paulo_1c"
  }

  depends_on = [aws_internet_gateway.sao_paulo_igw]
}