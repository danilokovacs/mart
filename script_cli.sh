#!/bin/bash
#####################################
#Script para atualização de pacotes##
#####################################
echo "Iniciando script de atualização de pacotes"
sudo apt update && sudo apt upgrade -y
echo "Finalizando script de atualização de pacotes"
#################################
#Script para instalação do java##
#################################
cd
versaojava="$(java -version 2>&1 | grep version | cut -d " " -f2)"
if [ "${versaojava}" ] ; then
sleep 2
    echo "Cliente possui java instalado"
    if [[ -f ./projeto-mart-cli.jar ]]
    then
    sleep 2
        echo "Aplicação já esta baixada"
        else
        echo "Baixando aplicação"
        wget -O projeto-mart-cli.jar https://github.com/danilokovacs/mart/raw/main/projeto-mart-cli.jar
        echo "Aplicação baixada"
    fi
else
    echo "Cliente nao possui java instalado"
        if [[ -f ./projeto-mart-cli.jar ]]
        then
            echo "Aplicação já esta baixada"
            else
            echo "Baixando aplicação"
            wget -O projeto-mart-cli.jar https://github.com/danilokovacs/mart/raw/main/projeto-mart-cli.jar
            echo "Aplicação baixada"
            cd
            echo "Instalando java 11"
            sudo apt install openjdk-11-jre -y
        fi
fi
###################################
#Script para instalação do docker##
###################################
echo "Instalando docker"
sudo apt install docker.io -y
echo "Iniciando docker"
sudo systemctl start docker
echo "Habilitando docker"
sudo systemctl enable docker
echo "Baixando imagem do mysql"
sudo docker pull mysql:5.7
echo "Executando imagem do conteiner mysql"
sudo docker run -d -p 3306:3306 --name ConteinerBD -e "MYSQL_DATABASE=mart" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
sudo docker ps -a
sleep 2
echo "Baixando imagem do java"
sudo docker pull openjdk:11
echo "Baixando Dockerfile para aplicação java"
wget -O Dockerfile https://github.com/danilokovacs/mart/raw/main/Dockerfile
sleep 2
echo "Fazendo build da aplicação"
sudo docker build . -t mart:1.0
sleep 2
echo "Realize a criação das tabelas no container de BD"
sleep 2
echo "Após isso..."
sleep 2
echo "Executar sudo docker run --name mart-cli -it <id docker>"
echo "sudo docker start mart-cli"
echo "sudo docker exec -it mart-cli bash"