pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
               git branch: 'master', url: 'https://github.com/AnchalJainn/project1.git'
            }
        }
        stage("Configure Server"){
            steps{
                ansiblePlaybook become: true, inventory: 'servers.txt', playbook: 'configuration-playbook.yml'
            }
        }
        stage('Docker Build'){
            steps{
                sh "docker build . -t anchaljaindevops/applebite:latest"
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
