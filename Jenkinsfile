pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
               git branch: 'master', url: 'https://github.com/AnchalJainn/project1.git'
            }
        }
        stage('Configure Server') {
            steps {
               ansiblePlaybook become: true, credentialsId: 'ansibleCredId', disableHostKeyChecking: true, inventory: 'servers.txt', playbook: 'configuration-playbook.yml'
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
                    sh ''' sudo docker login -u ${userVar} -p ${pwdVar}
                    sudo docker push anchaljaindevops/applebite:latest'''
                }                
            }
        }
        stage('Run Docker container'){
            steps{
               sh ''''docker rm -f \'docker ps -qa\' 
               sudo docker container run -d -p 8083:80 anchaljaindevops/applebite:latest'''
            }
        }
    }
}
