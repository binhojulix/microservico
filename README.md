# microservico

4. Run terraform output to get the SSH private key and save it to a file.
`terraform output -raw tls_private_key > id_rsa`
5. Run terraform output to get the virtual machine public IP address.
`terraform output public_ip_address`
6. Permission key
`chmod 600 id_rsa`
7. Use SSH to connect to the virtual machine.
`ssh -i id_rsa azureuser@<public_ip_address>`
8. Generate ssh key 
`ssh-keygen -t rsa -b 4096 -C "fxxxx@.com"`
9. Private ssh - Essa chave será usada na geração de ssh keys no github
`cat ~/.ssh/id_rsa.pub`
10. Configure a chave do github
`git config --global user.name "bxxx"`
`git config --global user.email xxxxz@xxx.com`
11. Teste ssh key
`ssh -T git@github.com`
12. Config git credentials on jenkins - Run 
`cat ~/.ssh/id_rsa`
13. Configurar o damemon do docker para expor o daemon remotamente
`sudo mkdir -p /etc/systemd/system/docker.service.d`
`sudo vi /etc/systemd/system/docker.service.d/override.conf`
`past this`

  [Service]
        ExecStart=
        ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376

`sudo systemctl daemon-reload`
`sudo systemctl restart docker.service`
`sudo systemctl status docker`

13. Get kubeconfig
`rm -rf ~/.kube/config`

14. Get credentiasl AKS
`az aks get-credentials --resource-group rg-lenient-kit --name rg-lenient-kitk8stest3`

15. Get kubeconfig
`cat ~/.kube/config`
16. Configurar o damemon do docker para expor o daemon remotamente
`sudo mkdir -p /etc/systemd/system/docker.service.d`
`sudo vi /etc/systemd/system/docker.service.d/override.conf`
`past this`
  [Service]
        ExecStart=
        ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376

`sudo launchctl  daemon-reload`
`sudo systemctl restart jenkins`
`sudo launchctl  restart docker.service`


create an kubernetes manigest to run this images
image myappacrfaluz.azurecr.io/server:v1


image myappacrfaluz.azurecr.io/wbapp:v1

docker tag mcr.microsoft.com/azuredocs/azure-vote-front:v1 acrappfaluz3/azure-vote-front:v1
docker tag mcr.microsoft.com/azuredocs/azure-vote-front:v1 acrappfaluz3.azurecr.io/azure-vote-front:v1

docker push acrappfaluz3.azurecr.io/azure-vote-front:v1



az acr repository list --name acrappfaluz3 --output table

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



