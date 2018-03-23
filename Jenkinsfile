#!/user/bin/env groovy
pipeline {
    agent any


    stages {
        stage('Build') {
            steps {
                echo 'Building....'
                sh 'chmod +x gradlew'
                sh './gradlew assemble'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing....'
                // sh 'chmod +x gradlew'
                // sh './gradlew test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'sudo systemctl stop tomcat'
                sh 'mv build/libs/taskmgmt-*.war build/libs/taskmgmt.war'
                //sh 'chmod -R o+rwx build/libs/taskmgmt.war'
                sh 'sudo cp build/libs/taskmgmt.war /opt/tomcat/webapps/'
                sh 'sudo systemctl start tomcat'
            }
        }
    }
}
