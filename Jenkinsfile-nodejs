pipeline {
    agent any
    tools {
        maven "maven3"
    }
    environment {
        registryName = "acrappfaluz3"
        dockerImage = 'acrimg'
        ACR_USERNAME = 'acrappfaluz3'
        ACR_PASSWORD = 'YFM68cuXBN/yabSzRwBWMXPPhRoYRCyUv4CDYliAVG+ACRDZdL7K'
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
                    dockerImage = docker.build("${registryName}:${env.BUILD_ID}")
                }
            }
        }
        
      stage('Push Image') {
        steps {
            script {
                withCredentials([usernamePassword(credentialsId: 'acrapp', usernameVariable: 'ACR_USERNAME', passwordVariable: 'ACR_PASSWORD')]) {
                    sh "docker login ${registryUrl} -u ${ACR_USERNAME} -p ${ACR_PASSWORD}"
                    sh "docker tag ${registryName}:${env.BUILD_ID} ${registryUrl}/${registryName}:${env.BUILD_ID}"
                    sh "docker push ${registryUrl}/${registryName}:${env.BUILD_ID}"
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
