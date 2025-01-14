#public Subnets
resource "aws_subnet" "hong_kong_subnet_public_1a" {
  provider          = aws.hong-kong
  vpc_id            = aws_vpc.hong-kong_vpc.id
  cidr_block        = "10.52.1.0/24"
  availability_zone = "ap-east-1a"

  tags = {
    Name = "hong_kong Subnet public 1a"
  }
}

resource "aws_subnet" "hong_kong_subnet_public_1b" {
  provider          = aws.hong-kong
  vpc_id            = aws_vpc.hong-kong_vpc.id
  cidr_block        = "10.52.2.0/24"
  availability_zone = "ap-east-1b"

  tags = {
    Name = "hong_kong Subnet public 1b"
  }
}

#private subnets
resource "aws_subnet" "hong_kong_subnet_private_1a" {
  provider          = aws.hong-kong
  vpc_id            = aws_vpc.hong-kong_vpc.id
  cidr_block        = "10.52.11.0/24"
  availability_zone = "ap-east-1a"

  tags = {
    Name = "hong_kong Subnet Private 1a"
  }
}

resource "aws_subnet" "hong_kong_subnet_private_1b" {
  provider          = aws.hong-kong
  vpc_id            = aws_vpc.hong-kong_vpc.id
  cidr_block        = "10.52.12.0/24"
  availability_zone = "ap-east-1b"

  tags = {
    Name = "hong_kong Subnet Private 1b"
  }
}