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
    stage('Git + Sonar') {
      steps {
        git(url: 'https://github.com/gabrielegranata1996/ArithmeticWebApp.git', branch: 'master')
        script {
          withSonarQubeEnv('Sonar_Qube') {
            def rtMaven = Artifactory.newMavenBuild()
            rtMaven = "Maven Default"
            rtMaven.run pom: 'pom.xml', goals:'sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=f662fa46cf0593d0b52b0b7a7ade779792813ab2'
          }
        }
        
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