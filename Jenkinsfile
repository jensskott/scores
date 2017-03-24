pipeline {
    agent any 

    stages {
        stage('Chckout git'){
          steps {
            git branch: 'master', credentialsId: 'b04eae48-e6bf-4b32-a53d-310ceaf239c6', url: 'ssh://git@bitbucket.org:company/repo.git'
          }
        }
        stage('Build Go') { 
            steps { 
                sh 'make build' 
            }
        }
        stage('Build Docker'){
            steps {
                sh 'docker -t mardle/scores:latest .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make publish'
            }
        }
    }
}