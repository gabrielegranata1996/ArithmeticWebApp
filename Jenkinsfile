pipeline {
  agent any
  stages {
    stage('Compile ArithmeticWebApp') {
      agent any
      steps {
        build '${Compile_ArithmeticWebApp}'
      }
    }
    stage('Test ArithmeticWebApp') {
      steps {
        build 'Test_ArithmeticWebApp'
      }
    }
  }
}