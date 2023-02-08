
#ec2 para o site (com regra de Spot ~Barateamento de recursos adicionais~)
resource "aws_spot_instance_request" "ec2_spot_ti_saude" {
  ami           = var.ami_aws
  spot_price    = "0.03"
  instance_type = "t2.micro"
  associate_public_ip_address = false #bloquear associação de IP Público
  tags = {
    Name = "ec2_ti_saude_spot"
  }
    subnet_id = "${aws_default_subnet.block_public.id}" #Essa subnet bloqueia a associação de ip Público na criação da EC2
    vpc_security_group_ids = ["${aws_security_group.block_public_access.id}"] #Id do Security Group que libera apenas o ssh
}

# criação do bucket S3 público.
resource "aws_s3_bucket" "testedevops_s3_08022023" {
  bucket = var.s3_bucket_name
}

# Por padrão os S3 agora vem com bloqueio público, aqui se configura para liberar o acesso.
resource "aws_s3_account_public_access_block" "aceitar_publico" {
  block_public_acls   = false
  block_public_policy = false
}

#Criação do RDS com Mysql
 resource "aws_db_instance" "ti_saude_rds" {
   allocated_storage    = 5
   db_name              = "ti_saude_db"
   engine               = "mysql"
   engine_version       = "5.7"
   instance_class       = "db.t3.micro"
   username             = "teste"
   password             = "ti_saude"
   parameter_group_name = "default.mysql5.7"
   skip_final_snapshot       = true
   publicly_accessible = false #essa opção bloqueia o acesso público ao RDS

   vpc_security_group_ids = ["${aws_security_group.block_public_access.id}"] #Id do Security Group que libera apenas o ssh
  
 }

