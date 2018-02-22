pipeline {
  agent any
    //Get Artifactory server instance, defined in the Artifactory Plugin
    def server = Artifactory.server "ART"
    //Create an Artifactory Maven instance
    def rtMaven = Artifactory.newMavenBuild();
    def buildInfo
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
