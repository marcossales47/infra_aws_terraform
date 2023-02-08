
#Essa subnet bloqueia a associação de ip Público na criação da EC2

resource "aws_default_subnet" "block_public" {
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false #variável que seta o bloqueio de ip público
  tags = {
    Name = "subnet_block_public_ip"
  }
}

#criação de Security Group para barrar Acesso externo à ec2 do site

resource "aws_security_group" "block_public_access" {
  name        = "allow ssh"
  description = "Bloqueia acesso publico"
  vpc_id = "vpc-0609a528f0c962b35"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"

    cidr_blocks      = ["177.19.149.146/32"] #só aceita conexão ssh pelos ip's liberados
    
  }
  tags = {
    Name = "block_public_access"
  }
}
