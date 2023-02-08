## Instruções de manuseio !

As etapas a seguir devem ser feitas antes de qualquer comando Terraform:

- 1) Instalar a AWS CLI e configurar com as credenciais e região padrão que estarão o Bucket, Ec2 e RDS

> no diretório raiz iniciar os seguintes comandos:

- 1) terraform init (para iniciar a configuração do ambiente aws)
- 2) terraform validate (para confirmar a validação do arquivo main.tf e restantes)
- 3) terraform plan (para visualizar o panorama geral de mudanças)
- 4) terraform apply (para aplicar) 

## Opcionalmente o comando abaixo destroi toda a infra instalada ##

            terraform destroy

## Observações
 - O RDS está setado para barrar acesso público
 - A EC2 está setada para subir sem IP Público por uma subnet criada especificamente para não associar Ips públicos.


## Imagem ECR do projeto

public.ecr.aws/k9h7w1h6/devops_teste:latest

