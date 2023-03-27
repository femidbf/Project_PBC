locals {
  ansible_user_data = <<-EOF
#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo apt-get update -y

### Installing Docker ###
sudo apt install docker.io -y
sudo apt-get install software-properties-common -y

### Installing Ansible ###
sudo apt-add-repository --yes --update ppa:ansible/ansible 
sudo apt-get install ansible -y

### changing ssh configs ###
echo "PubkeyAcceptedKeyTypes=+ssh-rsa" >> /etc/ssh/sshd_config.d/10-insecure-rsa-keysig.conf
sudo systemctl reload sshd
sudo bash -c 'echo "StrictHostKeyChecking No" >> /etc/ssh/ssh_config'
echo "${file(var.path_to_private_key)}" > /home/ubuntu/.ssh/Prj_PBC
echo "${local.ubuntu_cred.access}" >> /home/ubuntu/file.txt
sudo chown ubuntu:ubuntu /home/ubuntu/.ssh/Prj_PBC
sudo chgrp ubuntu:ubuntu /home/ubuntu/.ssh/Prj_PBC
sudo chmod 400 /home/ubuntu/.ssh/Prj_PBC
sudo echo "localhost ansible_connection=local" >> /etc/ansible/hosts
sudo echo "[docker-stage]" >> /etc/ansible/hosts
sudo echo "${var.docker-stageIP} ansible_ssh_private_key_file=/home/ubuntu/.ssh/Prj_PBC ansible_user=ec2-user" >> /etc/ansible/hosts
sudo echo "[docker-prod]" >> /etc/ansible/hosts
sudo echo "${var.docker-prodIP} ansible_ssh_private_key_file=/home/ubuntu/.ssh/Prj_PBC ansible_user=ec2-user" >> /etc/ansible/hosts
sudo mkdir /opt/docker
sudo chown -R ubuntu:ubuntu /opt/docker
sudo chmod -R 700 /opt/docker
cd /opt/docker
curl -O https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip
sudo apt install unzip -y
sudo unzip newrelic-java.zip
echo "${file(var.Dockerfile)}" >> /opt/docker/Dockerfile
echo "${file(var.docker_prod)}" >> /opt/docker/docker_prod.yml
echo "${file(var.docker_stage)}" >> /opt/docker/docker_stage.yml
echo "${file(var.docker_image)}" >> /opt/docker/docker_image.yml
sudo hostnamectl set-hostname ansible

EOF 
}