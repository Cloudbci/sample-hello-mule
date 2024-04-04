pipeline {
    agent any
    tools {
        git 'git'
        maven 'maven'
        }
    
    stages {      
        stage('Build') {
            // when {
            //     // Execute this stage only if the branch name matches one of the specified branches
            //     expression { 
            //         env.BRANCH_NAME == 'development' || 
            //         env.BRANCH_NAME == 'uat' || 
            //         env.BRANCH_NAME == 'release' || 
            //         env.BRANCH_NAME == 'main'
            //     }
            steps {
                // Use Maven to build the project
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
