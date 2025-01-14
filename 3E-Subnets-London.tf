#public Subnets
resource "aws_subnet" "london_subnet_public_1a" {
  provider          = aws.london
  vpc_id            = aws_vpc.london_vpc.id
  cidr_block        = "10.32.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "london Subnet public 1a"
  }
}

resource "aws_subnet" "london_subnet_public_1b" {
  provider          = aws.london
  vpc_id            = aws_vpc.london_vpc.id
  cidr_block        = "10.32.2.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "london Subnet public 1b"
  }
}

#private subnets
resource "aws_subnet" "london_subnet_private_1a" {
  provider          = aws.london
  vpc_id            = aws_vpc.london_vpc.id
  cidr_block        = "10.32.11.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "london Subnet Private 1a"
  }
}

resource "aws_subnet" "london_subnet_private_1b" {
  provider          = aws.london
  vpc_id            = aws_vpc.london_vpc.id
  cidr_block        = "10.32.12.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "london Subnet Private 1b"
  }
}