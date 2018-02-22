pipeline {
  agent any
  stages {
    stage('Clone Sources') {
      agent any
      steps {
        git 'https://github.com/gabrielegranata1996/ArithmeticWebApp.git'
      }
    }
    stage('Maven Build') {
      agent any
      steps {
        script {
          def rtMaven = Artifactory.newMavenBuild()
          rtMaven.tool = "Maven Default"
          rtMaven.run pom:'pom.xml', goals:'clean install'
          
        }
        
      }
    }
    stage('Publish Build') {
      agent any
      steps {
        script {
          server.publishBuildInfo buildInfo
        }
        
      }
    }
  }
}