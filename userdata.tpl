#!/bin/bash
#----- Docker install section -----#
sudo yum update -y
sudo amazon-linux-extras install -y docker 
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user

#----- CS server start in docker -----#
docker pull febley/counter-strike_server
docker run -d --name counter-strike_server -p ${game_port}:${game_port}/udp -p ${game_port}:${game_port} febley/counter-strike_server:latest
