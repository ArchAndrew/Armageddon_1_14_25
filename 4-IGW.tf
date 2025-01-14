resource "aws_internet_gateway" "tokyo_igw" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.tokyo_vpc.id

  tags = {
    Name = "Tokyo Internet Gateway"
  }
}

resource "aws_internet_gateway" "osaka_igw" {
  provider = aws.osaka
  vpc_id   = aws_vpc.osaka_vpc.id

  tags = {
    Name = "osaka Internet Gateway"
  }
}
resource "aws_internet_gateway" "virginia_igw" {
  provider = aws.virginia
  vpc_id   = aws_vpc.virginia_vpc.id

  tags = {
    Name = "virginia Internet Gateway"
  }
}

resource "aws_internet_gateway" "hong_kong_igw" {
  provider = aws.hong-kong
  vpc_id   = aws_vpc.hong-kong_vpc.id

  tags = {
    Name = "hong_kong Internet Gateway"
  }
}

resource "aws_internet_gateway" "australia_igw" {
  provider = aws.australia
  vpc_id   = aws_vpc.australia_vpc.id

  tags = {
    Name = "australia Internet Gateway"
  }

}
resource "aws_internet_gateway" "california_igw" {
  provider = aws.california
  vpc_id   = aws_vpc.california_vpc.id

  tags = {
    Name = "california Internet Gateway"
  }
}

resource "aws_internet_gateway" "london_igw" {
  provider = aws.london
  vpc_id   = aws_vpc.london_vpc.id

  tags = {
    Name = "london Internet Gateway"
  }
}


resource "aws_internet_gateway" "sao_paulo_igw" {
  provider = aws.sao-paulo
  vpc_id   = aws_vpc.sao-paulo_vpc.id

  tags = {
    Name = "sao_paulo Internet Gateway"
  }
}