pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        nodejs('NodeNext') {
          sh 'npm install --save'
          sh 'npm install -g dotenv --save'
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
        echo 'Not implemented'
      }
    }

  }
}