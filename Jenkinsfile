pipeline {
  agent any
  stages {
    stage('Clone Sources') {
      agent any
      steps {
        git 'https://github.com/gabrielegranata1996/ArithmeticWebApp.git'
      }
    }
    stage('Artifactory Config') {
      agent any
      steps {
        script {
          echo ${env.server}
          echo ${env.rtMaven}
        }
        
      }
    }
    stage('Maven Build') {
      agent any
      steps {
        script {
          def buildInfo
          buildInfo = ${rtMaven}.run pom:'pom.xml', goals:'clean install'
        }
        
      }
    }
    stage('Publish Build') {
      agent any
      steps {
        script {
          ${server}.publishBuildInfo ${buildInfo}
        }
        
      }
    }
  }
  environment {
    server = 'Artifactory.server "ART"'
    rtMaven = 'Artifactory.newMavenBuild();'
    buildInfo = ''
  }
}