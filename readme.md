# Desafio DevOps - Minsait

## Logar na conta AWS
Para iniciar o código é necessário estar logado em uma conta AWS através do CLI.
Utilize 'aws configure' para realizar o login.

## Fazer Deploy
Utilize 'terraform init' para inicializar o diretório de trabalho do Terraform.
Em seguida, utilize o comando 'terraform plan' para criar um plano de execução do Terraform (comando opcional, mas importante para ver as alterações que serão realizadas na infraestrutura).
Por último, utilize 'terraform apply' para aplicar as configurações de infraestrutura definidas no código e subir a VM, esse comando trará o 'terraform plan' e irá pedir uma confirmação para ser executado (para permitir digite 'yes').

## Visualizar a Aplicação
Após o comando 'terraform apply' ser executado será exibido no terminal um output com um endereço de IP público, nesse endereço será possível visualizar o WordPress. (Pode demorar alguns minutos para que o WordPress carregue após o deploy).

## Visualizar Contêineres
Para visualizar os contêineres que estão em execução, é necessário acessar a VM através do IP ou do console AWS.
Utilize o comando 'sudo docker ps' para exibir os contêineres.

## Observação
Os arquivos do Docker ('docker-compose.yml' e 'Dockerfile') serão criados no script de inicialização da VM, os arquivos de mesmo nome e conteúdo presentes no GitHub são para melhor visualização do código por parte do avaliador.