pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        nodejs('NodeNext') {
          sh 'yarn add mongodb swr'
          sh 'yarn add @types/mongodb -D'
          sh 'yarn install'
          sh 'yarn build'
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