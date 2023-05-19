pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
               git branch: 'master', url: 'https://github.com/AnchalJainn/project1.git'
            }
        }
        stage('Docker Build'){
            steps{
                sh '''sudo docker build . -t anchaljaindevops/applebite:latest
                sudo docker image ls'''
            }
        }        
        stage('DockerHub Push'){
            steps{ 
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pwdVar', usernameVariable: 'userVar')]) {
                    sh "docker login -u ${userVar} -p ${pwdVar}"
                }
                
                sh "docker push anchaljaindevops/applebite:latest "
            }
        }
    }
}
