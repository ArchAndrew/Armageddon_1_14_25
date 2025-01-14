#public Subnets
resource "aws_subnet" "virginia_subnet_public_1a" {
  provider          = aws.virginia
  vpc_id            = aws_vpc.virginia_vpc.id
  cidr_block        = "10.51.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Virginia Subnet public 1a"
  }
}

resource "aws_subnet" "virginia_subnet_public_1b" {
  provider          = aws.virginia
  vpc_id            = aws_vpc.virginia_vpc.id
  cidr_block        = "10.51.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Virginia Subnet public 1b"
  }
}

#private subnets
resource "aws_subnet" "virginia_subnet_private_1a" {
  provider          = aws.virginia
  vpc_id            = aws_vpc.virginia_vpc.id
  cidr_block        = "10.51.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Virginia Subnet Private 1a"
  }
}

resource "aws_subnet" "virginia_subnet_private_1b" {
  provider          = aws.virginia
  vpc_id            = aws_vpc.virginia_vpc.id
  cidr_block        = "10.51.12.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Virginia Subnet Private 1b"
  }
}