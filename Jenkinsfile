pipeline {
  agent any
  stages {
    stage('Clone Sources') {
      agent any
      steps {
        git 'https://github.com/gabrielegranata1996/ArithmeticWebApp.git'
      }
    }
    stage('Configuration') {
      steps {
        script {
          def server = Artifactory.server "ART"
          def rtMaven = Artifactory.newMavenBuild()
        }
        
      }
    }
    stage('Artifactory Config') {
      agent any
      steps {
        script {
          echo ${rtMaven}
          echo ${server}
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
}