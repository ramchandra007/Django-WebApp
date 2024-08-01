
pipeline {
    agent any
    environment {
          AWS_ACCESS_KEY_ID       = credentials('AWS-CRED')
          AWS_SECRET_ACCESS_KEY   = credentials('AWS-CRED')
}
stages {
stage('aws cred'){
steps{
     withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'AWS-CRED', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
    // some block
    
  }
 }   
}
        stage('Deploy to Dev') {
            steps {
                 sh '''
                 terraform init
                 terraform plan -out=dev.tfplan
                 terraform apply dev.tfplan
                 '''
                }
            }
        }
    }
       
    
