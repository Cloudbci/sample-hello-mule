pipeline {
    agent any
    
    stages {      
        stage('Build hello-mule application') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
             steps {
                 echo "Application in Testing Phase…"
                 sh 'mvn test'
             }
         }
        
        // stage('Deploy') {
        //     steps {
        //         // Deploy the application
        //         sh 'mvn deploy'
        //     }
        // }
    }
    
    post {
        success {
            echo 'Pipeline succeeded! Your application is built successfully.'
        }
        failure {
            echo 'Pipeline failed! Check the logs for details.'
        }
    }
}
