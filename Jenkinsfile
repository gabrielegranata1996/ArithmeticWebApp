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
          def rtMaven = Artifactory.newMavenBuild();
          def buildInfo
        }
        
      }
    }
    stage('Artifactory Config') {
      agent any
      steps {
        script {
          rtMaven.tool = "Maven Default"
          rtMaven.deployer releaseRepo:'libs-release-local', snapshotRepo:'libs-snapshot-local', server: server
          rtMaven.deployer releaseRepo:'libs-release', snapshotRepo:'libs-snapshot', server: server
        }
        
      }
    }
    stage('Maven Build') {
      agent any
      steps {
        script {
          buildInfo = rtMaven.run pom:'pom.xml', goals:'clean install'
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