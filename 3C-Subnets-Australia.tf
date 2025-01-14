#public Subnets
resource "aws_subnet" "australia_subnet_public_1a" {
  provider          = aws.australia
  vpc_id            = aws_vpc.australia_vpc.id
  cidr_block        = "10.30.1.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "australia Subnet public 2a"
  }
}

resource "aws_subnet" "australia_subnet_public_1b" {
  provider          = aws.australia
  vpc_id            = aws_vpc.australia_vpc.id
  cidr_block        = "10.30.2.0/24"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = "australia Subnet public 2b"
  }
}

#private subnets
resource "aws_subnet" "australia_subnet_private_1a" {
  provider          = aws.australia
  vpc_id            = aws_vpc.australia_vpc.id
  cidr_block        = "10.30.11.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "australia Subnet Private 1a"
  }
}

resource "aws_subnet" "australia_subnet_private_1b" {
  provider          = aws.australia
  vpc_id            = aws_vpc.australia_vpc.id
  cidr_block        = "10.30.12.0/24"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = "australia Subnet Private 2b"
  }
}