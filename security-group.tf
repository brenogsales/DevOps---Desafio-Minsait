# Cria uma VPC.
resource "aws_vpc" "devops-vpc" {
  cidr_block = "10.1.0.0/16"
}

# Cria o grupo de segurança padrão.
resource "aws_default_security_group" "devops-sg" {
  vpc_id = aws_vpc.devops-vpc.id

  # Permite acesso via SSH.
  ingress {
    description = "Permitir acesso via SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    
  }

  # Permite acesso via HTTP.
  ingress {
    description = "Permitir acesso via HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    
  }

  # Permite acesso ao MySQL.
  ingress {
    description = "Permitir acesso ao MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permite todo o tráfego de saída.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-sg"
  }
}