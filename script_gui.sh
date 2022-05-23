#!/bin/bash
#####################################
#Script para atualização de pacotes##
#####################################
echo "Iniciando script de atualização de pacotes"
sudo apt update && sudo apt upgrade -y
echo "Finalizando script de atualização de pacotes"
################################
#Script para instalação da GUI##
################################
guiexist="$(dpkg -s xrdp | grep ok | cut -d " " -f3)"
if [ \"$guiexist\" != \"ok\" ] ; then
echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Iniciando script de instalação de GUI..."
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 2
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Finalizando script de instalação de GUI..."
fi
echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "GUI ja instalada"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 2
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
#################################
#Script para instalação do java##
#################################
cd
versaojava="$(java -version 2>&1 | grep version | cut -d " " -f2)"
if [ "${versaojava}" ] ; then
sleep 2
    echo "Cliente possui java instalado"
    cd Desktop
    if [[ -f ./projeto-mart-gui.jar ]]
    then
    sleep 2
        echo "Aplicação já esta baixada"
        else
        echo "Baixando aplicação"
        wget -O projeto-mart-gui.jar https://github.com/danilokovacs/mart/raw/main/projeto-mart-gui.jar
        echo "Aplicação baixada"
    fi
    echo "Executando a aplicação"
        java -jar projeto-mart-gui.jar
else
    echo "Cliente nao possui java instalado"
        cd Desktop
        if [[ -f ./projeto-mart-gui.jar ]]
        then
            echo "Aplicação já esta baixada"
            else
            echo "Baixando aplicação"
            wget -O projeto-mart-gui.jar https://github.com/danilokovacs/mart/raw/main/projeto-mart-gui.jar
            echo "Aplicação baixada"
            cd
            echo "Instalando java 11"
            sudo apt install openjdk-11-jre -y
            cd Desktop
            echo "Executando a aplicação"
            java -jar projeto-mart-gui.jar
        fi
fi
