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
          withSonarQubeEnv('Sonar'){
            def rtMaven = Artifactory.newMavenBuild()
            rtMaven.tool = "Maven Default"
            rtMaven.run pom:'pom.xml', goals:'clean package sonar:sonar'
          }
        }
        
        waitForQualityGate()
      }
    }
    stage('Sonar Quality Gate') {
      steps {
        script {
          timeout(time: 1, unit: 'HOURS'){
            def qg = waitForQualityGate()
            if (qg.status != 'OK'){
              error "Pipeline aborted due to quality gate failure: "${qg}""
            }
          }
        }
        
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