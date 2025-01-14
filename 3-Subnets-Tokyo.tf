resource "aws_subnet" "tokyo_subnet_public_1a" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = "10.50.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "Tokyo Subnet public 1a"
  }
}



#private Subnets
resource "aws_subnet" "tokyo_subnet_private_1a" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = "10.50.11.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "Tokyo Subnet private 1a"
  }
}

resource "aws_subnet" "tokyo_subnet_private_1c" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = "10.50.13.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "Tokyo Subnet private 1c"
  }
}

resource "aws_subnet" "tokyo_subnet_private_1d" {
  provider          = aws.tokyo
  vpc_id            = aws_vpc.tokyo_vpc.id
  cidr_block        = "10.50.14.0/24"
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "Tokyo Subnet private 1d"
  }
}
