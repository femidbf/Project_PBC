# Create VPC
resource "aws_vpc" "vpc_name" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

# Create Public Subnet 1
resource "aws_subnet" "PubSN1_name" {
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = var.PubSN1_cidr_block
  availability_zone = var.PubSN1_az1
  tags = {
    Name = var.PubSN1_name
  }
}

# Create Public Subnet 2
resource "aws_subnet" "PubSN2_name" {
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = var.PubSN2_cidr_block
  availability_zone = var.PubSN2_az2
  tags = {
    Name = var.PubSN2_name
  }
}

# Create Private Subnet 1
resource "aws_subnet" "PrvSN1_name" {
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = var.PrvSN1_cidr_block
  availability_zone = var.PrvSN1_az1
  tags = {
    Name = var.PrvSN1_name
  }
}

# Create Private Subnet 2
resource "aws_subnet" "PrvSN2_name" {
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = var.PrvSN2_cidr_block
  availability_zone = var.PrvSN2_az2
  tags = {
    Name = var.PrvSN2_name
  }
}

# Create IGW
resource "aws_internet_gateway" "IGW_name" {
  vpc_id = aws_vpc.vpc_name.id
  tags = {
    Name = var.IGW_name
  }
}

# Create Elastic IP
resource "aws_eip" "EIP_name" {
  vpc = true
  tags = {
    Name = var.EIP_name
  }
}

# Create NGW
resource "aws_nat_gateway" "NGW_name" {
  subnet_id         = aws_subnet.PubSN1_name.id
  allocation_id = aws_eip.EIP_name.id

  tags = {
    Name = var.NGW_name
  }

   depends_on = [aws_internet_gateway.IGW_name]
}

# Create Public Route Table
resource "aws_route_table" "Pub_RTB_name" {
  vpc_id = aws_vpc.vpc_name.id

  route {
    cidr_block = var.all_IP
    gateway_id = aws_internet_gateway.IGW_name.id
  }

  tags = {
    Name = var.Pub_RTB_name
  }
}

# Create Private Route Table
resource "aws_route_table" "Prv_RTB_name" {
  vpc_id = aws_vpc.vpc_name.id

  route {
    cidr_block = var.all_access
    gateway_id = aws_nat_gateway.NGW_name.id
  }

  tags = {
    Name = var.Prv_RTB_name
  }
}

# Create Public Subnet 1 Association
resource "aws_route_table_association" "Pub_RTB_AS1_name" {
  subnet_id      = aws_subnet.PubSN1_name.id
  route_table_id = aws_route_table.Pub_RTB_name.id
}

# Create Public Subnet 2 Association
resource "aws_route_table_association" "Pub_RTB_AS2_name" {
  subnet_id      = aws_subnet.PubSN2_name.id
  route_table_id = aws_route_table.Pub_RTB_name.id
}

#Create Private Subnet 1 Association
resource "aws_route_table_association" "Prv_RTB_AS1_name" {
  subnet_id      = aws_subnet.PrvSN1_name.id
  route_table_id = aws_route_table.Prv_RTB_name.id
}

#Create Private Subnet 2 Association
resource "aws_route_table_association" "Prv_RTB_AS2_name" {
  subnet_id      = aws_subnet.PrvSN2_name.id
  route_table_id = aws_route_table.Prv_RTB_name.id
}