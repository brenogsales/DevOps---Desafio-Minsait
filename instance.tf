# Cria uma instância EC2 (VM).
resource "aws_instance" "devops" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_default_security_group.devops-sg.id]
  key_name               = aws_key_pair.devops-key.key_name
  subnet_id              = aws_subnet.devops-subnet.id
  user_data = file("inicializacao.sh")

  tags = {
    Name = "devops"
  }

  associate_public_ip_address = true # Associa um endereço IP público à instância.
}

# Cria key-pair SSH.
resource "aws_key_pair" "devops-key" {
  key_name   = "Terraform"
  public_key = file("${path.module}/terraform-key.pub")
}

# Cria uma subnet.
resource "aws_subnet" "devops-subnet" {
  vpc_id            = aws_vpc.devops-vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"
}

# Cria um gateway da internet.
resource "aws_internet_gateway" "devops-gateway" {
  vpc_id = aws_vpc.devops-vpc.id
}

# Cria uma tabela de rotas.
resource "aws_route_table" "devops-route" {
  vpc_id = aws_vpc.devops-vpc.id

  # Rota padrão para todo o tráfego.
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.devops-gateway.id
  }
}

# Associa a tabela de rotas à subnet.
resource "aws_route_table_association" "devops-route-a" {
  subnet_id      = aws_subnet.devops-subnet.id
  route_table_id = aws_route_table.devops-route.id
}

# Output do IP público no terminal.
output "instance_public_ip" {
  value       = aws_instance.devops.public_ip
}
