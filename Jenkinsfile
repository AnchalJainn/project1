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
               sh '''container=$(sudo  docker container ls --format="{{.ID}}\\\\t{{.Ports}}" | awk \\\'{print $1}\\\')
                if [ -z "$container" ]
                then
                sudo docker rm -f ${container}
                fi
                '''
            }
        }
    }
}
