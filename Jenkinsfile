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
          def server = Artifactory.server "ART"
          def rtMaven = Artifactory.newMavenBuild();
          rtMaven.tool = "Maven Default"
          rtMaven.deployer releaseRepo:'libs-release-local', snapshotRepo:'libs-snapshot-local', server: server
          rtMaven.deployer releaseRepo:'libs-release', snapshotRepo:'libs-snapshot', server: server
          def buildInfo = rtMaven.run pom:'pom.xml', goals:'install'
          server.publishBuildInfo buildInfo
        }
        
      }
    }
  }
}