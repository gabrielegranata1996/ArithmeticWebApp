pipeline {
  agent any
  stages {
    stage('Compile ArithmeticWebApp') {
      parallel {
        stage('Compile ArithmeticWebApp') {
          agent any
          steps {
            build 'Compile_ArithmeticWebApp'
          }
        }
        stage('Git Clone') {
          steps {
            git 'https://github.com/gabrielegranata1996/ArithmeticWebApp.git'
          }
        }
      }
    }
    stage('Test ArithmeticWebApp') {
      steps {
        build 'Test_ArithmeticWebApp'
      }
    }
    stage('Sonar ArithmeticWebapp') {
      steps {
        build 'Sonar_ArithmeticWebApp'
      }
    }
    stage('QualityGate  ') {
      steps {
        build 'QualityGate_ArithmeticWebApp'
      }
    }
    stage('Publish Build') {
      steps {
        build 'Install_ArithmeticWebApp'
      }
    }
    stage('Deploy ') {
      steps {
        build 'Deploy_ArithmeticWebApp'
      }
    }
  }
}