#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user

docker pull febley/counter-strike_server
docker run -d --name counter-strike_server -p 27015:27015/udp -p 27015:27015 febley/counter-strike_server:latest