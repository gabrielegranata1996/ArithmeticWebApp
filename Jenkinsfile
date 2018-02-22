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
          def rtMaven = Artifactory.newMavenBuild();
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
          def buildInfo = rtMaven.run pom:'pom.xml', goals:'clean install'
          echo buildInfo
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