pipeline {
  agent any
  environment {
    scanner = tool('SonarScanner')
  }
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
        withSonarQubeEnv('SonarScanner') {
          sh '${scanner}/bin/sonar-scanner -X'
        }
      }
    }

  }
}