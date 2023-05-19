pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
               git branch: 'master', url: 'https://github.com/AnchalJainn/project1.git'
            }
        }
        stage("Configure Agent"){
            steps{
                sh '''sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installDocker.sh -P /tmp
                    sudo chmod 755 /tmp/installDocker.sh
                    sudo bash /tmp/installDocker.sh'''
            }
        }
        stage('Docker Build'){
            steps{
                sh "sudo docker build . -t anchaljaindevops/applebite:latest"
            }
        }        
        stage('DockerHub Push'){
            steps{ 
                withCredentials([usernamePassword(credentialsId: 'dockerpwd1706', passwordVariable: 'pwd')]) {
                      sh "docker login -u anchaljaindevops -p ${pwd}"
                }
                
                sh "docker push anchaljaindevops/applebite:latest "
            }
        }
    }
}
