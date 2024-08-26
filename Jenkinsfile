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
                    withDockerRegistry(credentialsId: 'jaffa') {
                         sh 'docker build -t vamshidharreddy06/django .'
                         sh 'docker push vamshidharreddy06/django:latest'
                   }
               }
            }
        }
    }
}
