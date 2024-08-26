pipeline {
    agent any

    stages {
        stage('clone') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url:'https://github.com/ramchandra007/Django-WebApp.git ']]) 
            }
        }
        stage('docker') {
            steps {
                script {
                   withDockerRegistry(credentialsId: 'pk') {
                         sh 'docker build -t ramchandramazzari/django .'
                         sh 'docker push ramchandramazzari/django:latest'
                   }
               }
            }
        }
    }
}
