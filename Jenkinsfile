pipeline {
  agent any
  stages {
    stage('Clone Sources') {
      agent any
      steps {
        build 'Compile_ArithmeticWebApp'
      }
    }
  }
}