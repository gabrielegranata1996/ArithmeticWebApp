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
      steps {
        script {
          def rtMaven = Artifactory.newMavenBuild()
          rtMaven.tool = "Maven Default"
          rtMaven.run pom:'pom.xml', goals:'sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=f662fa46cf0593d0b52b0b7a7ade779792813ab2'
        }
        
      }
    }
    stage('Sonar Quality Gate') {
      steps {
        waitForQualityGate()
      }
    }
    stage('Package') {
      steps {
        script {
          def rtMaven = Artifactory.newMavenBuild()
          rtMaven.tool = "Maven Default"
          rtMaven.run pom:'pom.xml', goals:'package'
        }
        
      }
    }
  }
}