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
                    withDockerRegistry(credentialsId: 'jenkin-cred') {
                         sh 'docker build -t ramchandra777/django .'
                         sh 'docker push ramchandra777/django:latest'
                   }
               }
            }
        }
    }
}
