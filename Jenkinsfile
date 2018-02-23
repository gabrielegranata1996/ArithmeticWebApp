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
          rtMaven.run pom:'pom.xml', goals:'compile'
        }
        
      }
    }
    stage('Maven Test') {
      steps {
        script {
          def rtMaven = Artifactory.newMavenBuild()
          rtMaven.tool = "Maven Default"
          rtMaven.run pom:'pom.xml', goals:'test'
        }
        
      }
    }
    stage('Sonar Inspection') {
      agent any
      steps {
        script {
          withSonarQubeEnv('Sonar_Qube'){
            def rtMaven = Artifactory.newMavenBuild()
            rtMaven.tool = "Maven Default"
            rtMaven.run pom:'pom.xml', goals:'sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=f662fa46cf0593d0b52b0b7a7ade779792813ab2'
          }
        }
        
      }
    }
    stage('Sonar Quality Gate') {
      steps {
        script {
          timeout(time: 1, unit: 'HOURS'){
            def qg = waitForQualityGate()
            if (qg.status != 'OK'){
              error "Pipeline aborted due to quality gate failure: ${qg.status}"
            }
          }
        }
        
      }
    }
    stage('Publish Build') {
      steps {
        script {
          def server = Artifactory.server "ART"
          def rtMaven = Artifactory.newMavenBuild();
          rtMaven.tool = "Maven Default"
          rtMaven.deployer releaseRepo:'libs-release-local', snapshotRepo:'libs-snapshot-local', server: server
          rtMaven.deployer releaseRepo:'libs-release', snapshotRepo:'libs-snapshot', server: server
          def buildInfo = rtMaven.run pom:pom.xml, goals:'install'
          server.publishBuildInfo buildInfo
        }
        
      }
    }
  }
}