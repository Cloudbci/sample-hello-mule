pipeline {
    agent { dockerfile true }   
    tools {
    jfrog 'jfrog-cli'
    }
    environment {
        JFROG_URL = "https://jozsefa.jfrog.io"
        JFROG_CLI_HOME = "/home/jenkins/.jfrog"
        JFROG_ACCESS_TOKEN = credentials("jfrog-access-token")
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
                sh 'mvn clean -U -B package --file pom.xml'
                }
        }
         stage('Check JFrog CLI version') {
             steps{
                 sh 'jf --version'
                 sh 'whoami'
             }
         }
        
        stage('Publish to JFrog') {
            steps {                 
              // withCredentials([usernamePassword(credentialsId: 'jfrog', usernameVariable: 'JFROG_USERNAME', passwordVariable: 'JFROG_PASSWORD')]) 
               //{                     
                    script { 
                        
                           sh 'jf rt upload --url ${JFROG_URL} --access-token ${JFROG_ACCESS_TOKEN} ./target/*.jar hellomule/'
                            }
                    //}
            }
        }
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
