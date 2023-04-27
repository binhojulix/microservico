# microservico

4. Run terraform output to get the SSH private key and save it to a file.
`terraform output -raw tls_private_key > id_rsa`
5. Run terraform output to get the virtual machine public IP address.
`terraform output public_ip_address`
6. Use SSH to connect to the virtual machine.
`ssh -i id_rsa azureuser@<public_ip_address>`
7. Generate ssh key 
`ssh-keygen -t rsa -b 4096 -C "fxxxx@.com"`
8. Private ssh - Essa chave será usada na geração de ssh keys no github
`cat ~/.ssh/id_rsa.pub`
9. Configure a chave do github
`git config --global user.name "bxxx"`
`git config --global user.email xxxxz@xxx.com`
10. Teste ssh key
`ssh -T git@github.com`
11. Config git credentials on jenkins - Run 
`cat ~/.ssh/id_rsa`
12. Configurar o damemon do docker para expor o daemon remotamente
`sudo mkdir -p /etc/systemd/system/docker.service.d`
`sudo vi /etc/systemd/system/docker.service.d/override.conf`
`past this`

  [Service]
        ExecStart=
        ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376

`sudo systemctl daemon-reload`
`sudo systemctl restart docker.service`

13. Get kubeconfig
`rm -rf ~/.kube/config`

14. Get kubeconfig
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


az vm create \
--resource-group rg-leading-griffon \
--name jenkins-vm \
--image UbuntuLTS \
--admin-username "azureuser" \
--generate-ssh-keys \
--public-ip-sku Standard \
--custom-data cloud-init-jenkins.txt


az vm list -d -o table --query "[?name=='jenkins-vm']"

az vm show \
--resource-group rg-exact-reptile \
--name jenkins-vm -d \
--query [publicIps] \
--output tsv


terraform {



