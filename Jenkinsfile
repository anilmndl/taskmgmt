#!/user/bin/env groovy
pipeline{
  agent any
	

  stages{
    stage('Build'){
      steps{
        echo 'Building....'
	sh 'chmod +x gradlew'
	sh './gradlew assemble'
      }
    }
    stage('Test'){
      steps{
        echo 'Testing....'
	sh 'chmod +x gradlew'
	//sh './gradlew test'
      }
    }
    stage('Deploy'){
      steps{
        echo 'Deploying....'
	sh 'mv build/libs/taskmgmt-*.war build/libs/taskmgmt.war'
	sh 'cp build/libs/taskmgmt.war /opt/tomcat/webapps/'
	sh 'sudo systemctl reload tomcat'
      }
    }
  }
}
