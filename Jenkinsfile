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
      parallel {
        stage('Config Artifactory') {
          agent any
          steps {
            sh '''def server = Artifactory.server "ART"
def rtMaven = Artifactory.newMavenBuild();



'''
          }
        }
        stage('Repositories') {
          steps {
            sh '''rtMaven.tool = "Maven Default"
rtMaven.deployer releaseRepo:\'libs-release-local\', snapshotRepo:\'libs-snapshot-local\', server: server
rtMaven.deployer releaseRepo:\'libs-release\', snapshotRepo:\'libs-snapshot\', server: server'''
          }
        }
      }
    }
    stage('Maven Build') {
      steps {
        sh '''def buildInfo
buildInfo = rtMaven.run pom:\'pom.xml\', goals:\'clean intall\''''
      }
    }
    stage('Publish Build') {
      steps {
        sh 'server.publishBuildInfo buildInfo'
      }
    }
  }
}