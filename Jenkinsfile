pipeline {
  agent any
  stages {
    stage('Clone Sources') {
      agent any
      steps {
        git 'https://github.com/gabrielegranata1996/ArithmeticWebApp.git'
      }
    }
    stage('Config Artifactory') {
      agent any
      steps {
        script {
          rtMaven.tool = "Maven Default"
          
        }
        
        script {
          rtMaven.deployer releaseRepo:'libs-release-local', snapshotRepo:'libs-snapshot-local', server: server
        }
        
        script {
          rtMaven.deployer releaseRepo:'libs-release', snapshotRepo:'libs-snapshot', server: server
        }
        
      }
    }
    stage('Maven Build') {
      environment {
        buildInfo = ''
      }
      steps {
        script {
          buildInfo = rtMaven.run pom:'pom.xml', goals:'clean intall'
        }
        
      }
    }
    stage('Publish Build') {
      steps {
        script {
          server.publishBuildInfo buildInfo
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