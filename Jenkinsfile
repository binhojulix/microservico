pipeline {
    agent any
    tools {
        maven "maven3"
    }
    environment {
        registryName = "acrappfaluz3"
        dockerImage = 'acrimg'
        ACR_USERNAME = 'acrappfaluz3'
        registryUrl = "acrappfaluz3.azurecr.io"
    }
    stages {
        stage('checkout') {
            steps {
               checkout scmGit(
                   branches: [[name: '*/main']],
                   userRemoteConfigs: [[credentialsId: 'gitssh', url: 'git@github.com:binhojulix/microservico.git']]
               )
            }
        }
        
        stage('Build') {
            steps {
                sh "mvn clean install"
            }
        }
        
        stage('Build Image'){
            steps {
                script {
                    dockerImage = docker.build("${dockerImage}:${env.BUILD_ID}")
                }
            }
        }
        
      stage('Push Image') {
        steps {
            script {
                withCredentials([usernamePassword(credentialsId: 'acrapp', usernameVariable: 'ACR_USERNAME', passwordVariable: 'ACR_PASSWORD')]) {
                    sh "docker login ${registryUrl} -u ${ACR_USERNAME} -p ${ACR_PASSWORD}"
                    sh "docker tag ${dockerImage}:${env.BUILD_ID} ${registryUrl}/${dockerImage}:${env.BUILD_ID}"
                    sh "docker push ${registryUrl}/${dockerImage}:${env.BUILD_ID}"
                }
            }
        }
}

     stage ('K8S Deploy') {
              steps {
                script {
                    withKubeConfig([credentialsId: 'aks', serverUrl: '']) {
                    sh ('kubectl apply -f jenkins-aks-deploy-from-acr.yaml')
                    }
                }
            }
        }

    }
}
