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
    stage('Sonar Quality Gate') {
      steps {
        build 'Sonar_ArithmeticWebApp'
      }
    }
    stage('Publish Build') {
      steps {
        build 'Install_ArithmeticWebApp'
      }
    }
    stage('Test_Performance') {
      steps {
        build 'Test_Performance'
      }
    }
  }
}