#Creating a Secure Connection Between an EC2 Instance and a Aurora RDS Database

#Terraform Provider

provider "aws" {
  region = "ap-northeast-3"
}



#Create a Route Table and Associate it with the VPC

#public route table with internet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.osaka_vpc.id
  tags = {
    Name = "Public route_table"
  }
}

#public subnet associated with the subnet
resource "aws_route_table_association" "public-route-table-association" {
  subnet_id      = aws_subnet.osaka_subnet_public_3a.id
  route_table_id = aws_route_table.public_route_table.id
}

#routing internet to public subnet
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"  # This is the default route for internet-bound traffic
  gateway_id             = aws_internet_gateway.osaka_igw.id
}


#private route table without internet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.osaka_vpc.id
  tags = {
    Name = "private route_table"
  }
}

#private subnet associated with the subnet
resource "aws_route_table_association" "private-route-table-association" {
  subnet_id      = aws_subnet.osaka_subnet_private_3a.id
  route_table_id = aws_route_table.private_route_table.id
}


#creating ec2 instance
resource "aws_instance" "ec2" {
    provider = aws.osaka
    ami = "ami-00dda9c6b6a1e5d93"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.osaka_subnet_private_3c.id
    associate_public_ip_address = true
    key_name = "MyLinuxBox"
    tags = {
        Name = "EC2-for-RDS"
    }
    security_groups = [ aws_security_group.sg_for_ec2.id ]
}

resource "aws_security_group" "sg_for_ec2" {
  name        = "allow_ssh"
  vpc_id      = aws_vpc.osaka_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

