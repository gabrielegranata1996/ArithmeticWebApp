pipeline {
  agent any
  stages {
    stage('Compile ArithmeticWebApp') {
      agent any
      steps {
        build 'Compile_ArithmeticWebApp'
      }
    }
    stage('Test ArithmeticWebApp') {
      steps {
        build 'Test_ArithmeticWebApp'
      }
    }
    stage('Sonar Scanning') {
      steps {
        build 'Sonar_ArithmeticWebApp'
      }
    }
    stage('QualityGate') {
      steps {
        build 'QualityGate_ArithmeticWebApp'
      }
    }
    stage('Publish Build') {
      steps {
        build 'Install_ArithmeticWebApp'
      }
    }
    stage('Deploy') {
      steps {
        build 'Deploy_ArithmeticWebApp'
      }
    }
  }
}