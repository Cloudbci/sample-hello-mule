pipeline {
    agent { dockerfile true }   
    tools {
    jfrog 'jfrog-cli'
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
        
        stage('Publish to JFrog') {
            steps {                 
               withCredentials([usernamePassword(credentialsId: 'jfrog', usernameVariable: 'JFROG-USERNAME', passwordVariable: 'JFROG-ACCESSTOKEN')]) 
               {                     
                    script {                                                
                           def jfrogUrl = 'https://jozsefa.jfrog.io'                                                                                                                
                           sh 'jf rt upload --url ${jfrogUrl} --access-token ${JFROG-ACCESSTOKEN} ./target/*.jar hellomule/'
                            }
                    }
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
