pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/AnchalJainn/project1.git'
            }
        }
        stage('Docker Build'){
            steps{
                sh "docker build . -t anchaljaindevops/applebite:latest"
            }
        }
        stage('DockerHub Push'){
            steps{ 
                withCredentials([usernamePassword(credentialsId: 'dockerpwd', passwordVariable: 'pwd')]) {
                      sh "docker login -u anchaljaindevops -p ${pwd}"
                }
                
                sh "docker push anchaljaindevops/applebite:latest "
            }
        }
    }
}
