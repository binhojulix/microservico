# microservico

1. Generate ssh key 
`ssh-keygen -t rsa -b 4096 -C "fabio.jdluz@gmail.com"`

2. Configurar a chave do github
`git config --global user.name "binhojulix"`
`git config --global user.email fabio.jdluz@gmail.com`

3. Teste ssh key
`ssh -T git@github.com`

4. Private ssh
`cat ~/.ssh/id_rsa`

5. Get kubeconfig
`cat ~/.kube/config`

5. Configurar o damemon do docker para expor o daemon remotamente
`sudo mkdir -p /etc/systemd/system/docker.service.d`
`sudo vi /etc/systemd/system/docker.service.d/override.conf`
`past this`
  [Service]
        ExecStart=
        ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376

`sudo launchctl  daemon-reload`
`sudo launchctl  restart docker.service`


6. `docker-compose -f jenkins-docker-compose.yml up`
7. `docker-compose -f sonar-docker-compose.yml up`
8. `docker-compose -f grana-prometheus-compose.yml up`
8. `docker-compose -f app-docker-compose.yml up`