#!/user/bin/env groovy
pipeline{
  agent any
	

  stages{
    stage('Build'){
      steps{
        echo 'Building....'
	sh 'chmod +x gradlew'
	sh './gradlew package'
      }
    }
    stage('Test'){
      steps{
        echo 'Testing....'
	//grails 'test-app'
      }
    }
    stage('Deploy'){
      steps{
        echo 'Deploying....'
	//mv 'build/libs/taskmgmt-*.war build/libs/taskmgmt.war'
	//cp 'build/libs/taskmgmt.war /opt/tomcat/webapps/'
      }
    }
  }
}
