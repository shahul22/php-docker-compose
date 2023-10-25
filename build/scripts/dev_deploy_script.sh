#!/bin/sh

install_required_packages() {
    apk add --update openssh-client # Install SSH client (for Alpine Linux; use apt-get or yum for other distributions)
    apk add --update --no-cache openssh sshpass
    apk add --update --no-cache docker docker-compose
    echo "Installed Required Packages Successfully"
}

clone_or_update_repository() {
    sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST "cd /root/gitops/demo-gitlab/ && docker-compose down || docker-compose -f docker-compose-8.0.yml down"
    sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST "cd /root/gitops/ && rm -rf demo-gitlab"
    sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST "cd /root/gitops/ && git clone http://root:Nahil12345@8.213.16.10:8088/root/demo-gitlab.git" # Clone or update the repository with a password
}

deploy_with_docker_compose() {
    sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST "cd /root/gitops/demo-gitlab && docker-compose build && docker-compose up -d" # Deploy using Docker Compose with a password
}

install_required_packages
clone_or_update_repository
deploy_with_docker_compose
echo "Deployed successfully on Dev Environment"
