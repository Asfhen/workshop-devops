pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        nodejs('NodeNext') {
          sh 'npm install --save mongodb swr'
          sh 'npm install @types/mongodb -D'
          sh 'npm install'
          sh 'npm run build'
        }

      }
    }

    stage('Test') {
      steps {
        nodejs('NodeNext') {
          sh 'npm run typecheck'
        }

      }
    }

    stage('SonarQube') {
      steps {
        withSonarQubeEnv('SonnarScanner') {
          sh '${scanner}/bin/sonar-scanner -X'
        }

      }
    }

  }
  environment {
    scanner = tool('SonnarScanner')
  }
}