#!/user/bin/env groovy
pipeline{
  def workspace = pwd()
  agent any
	

  stages{
    stage('Build'){
      steps{
        echo 'Building....'
	sh 'cd ${workspace}/taskmgmt'
	sh 'grails war'
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
