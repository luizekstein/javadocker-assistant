#!/bin/bash

PURPLE='0;35'
NC='\033[0m' 
VERSAO=11
	
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Olá Usuário, serei seu assistente para instalação do Java e do Docker!;"
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Primeiramente, iremos atualizar o seu sistema.;"
sudo apt update -y
sudo apt upgrade
echo  "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Agora, vou verificar aqui se você possui o Java instalado...;"

java -version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Olá você já tem o java instalado!!"
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Java instalado, mas sem problemas, irei resolver isso agora!"
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Java (S/N)?"
	read inst
	if [ \"$inst\" == \"s\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Java ;D"
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Adicionando o repositório!"
			sleep 2
			sudo add-apt-repository ppa:webupd8team/java -y
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Atualizando! Quase lá."
			sleep 2
			sudo apt update -y
			clear
			
			if [ $VERSAO -eq 11 ]
				then
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Preparando para instalar a versão 11 do Java. Confirme a instalação quando solicitado ;D"
					sudo apt install default-jre ; apt install openjdk-11-jre-headless; -y
					clear
					echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) Java instalado com sucesso!"
				fi
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Java por enquanto, até a próxima então!"
	fi
fi
echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Agora irei ver se você possui o docker instalado...;"
docker --version
if [ $? -eq 0 ]
	then
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7) : Olá você já tem o docker instalado!!"
	else
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Opa! Não identifiquei nenhuma versão do Docker instalado, mas sem problemas, irei resolver isso agora!"
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme para mim se realmente deseja instalar o Docker (S/N)?"
	read inst
	if [ \"$inst\" == \"s\" ]
		then
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Ok! Você escolheu instalar o Docker ;D"
			sleep 2
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Confirme a instalação quando for solicitado."
			sleep 2
			sudo apt install docker.io
			sudo apt install docker-compose
			clear
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Configurando! Quase lá."
			sleep 2
			sudo systemctl start docker
			sudo systemctl enable docker
			sudo usermod -aG docker $USER
			sudo service docker restart
			sleep 2
			echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Pronto! Docker instalado com sucesso."
		else 	
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Você optou por não instalar o Docker por enquanto, até a próxima então!"
	fi
fi
if [ -d javadocker/ ];
	then
	 	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Agora, vamos dar um pull no arquivo."
	 	cd javadocker/; 
		git pull;
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Agora, vamos clonar o repositório."
	 	git clone https://github.com/luizekstein/javadocker;
		cd javadocker/;
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Pronto! Irei criar seu container para executar o mesmo."
		sleep 5
		sudo docker-compose up -d --build;
		sleep 5
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Container criado com sucesso! Vamos entrar nele agora."
		sudo docker exec -it java-docker bash;
	else 
	 	echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Agora, vamos clonar o repositório."
	 	git clone https://github.com/luizekstein/javadocker;
		sleep 5
		cd javadocker
		sleep 5
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Pronto! Irei criar seu container para executar o mesmo."
		sleep 5
		sudo docker-compose up -d --build;
		sleep 5
		echo "$(tput setaf 10)[Bot assistant]:$(tput setaf 7)  Container criado com sucesso! Vamos entrar nele agora."
		sudo docker exec -it java-docker bash;
fi

# ===================================================================
# Todos direitos reservados para o autor: Dra. Profa. Marise Miranda.
# Sob licença Creative Commons @2020
# Podera modificar e reproduzir para uso pessoal.
# Proibida a comercialização e a exclusão da autoria.
# ===================================================================
