#public Subnets
resource "aws_subnet" "sao_paulo_subnet_public_1a" {
  provider          = aws.sao-paulo
  vpc_id            = aws_vpc.sao-paulo_vpc.id
  cidr_block        = "10.33.1.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "sao_paulo Subnet public 1a"
  }
}

resource "aws_subnet" "sao_paulo_subnet_public_1c" {
  provider          = aws.sao-paulo
  vpc_id            = aws_vpc.sao-paulo_vpc.id
  cidr_block        = "10.33.3.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "sao_paulo Subnet public 1c"
  }
}

#private subnets
resource "aws_subnet" "sao_paulo_subnet_private_1a" {
  provider          = aws.sao-paulo
  vpc_id            = aws_vpc.sao-paulo_vpc.id
  cidr_block        = "10.33.11.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "sao_paulo Subnet Private 1a"
  }
}

resource "aws_subnet" "sao_paulo_subnet_private_1c" {
  provider          = aws.sao-paulo
  vpc_id            = aws_vpc.sao-paulo_vpc.id
  cidr_block        = "10.33.13.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "sao_paulo Subnet Private 1c"
  }
}