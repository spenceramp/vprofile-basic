pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'githubkey', url: 'git@github.com:spenceramp/vprofile-basic.git']])
            }
        }
        
        
        stage('init') {
            steps {
                sh "pwd"
                sh "terraform --version"
            }
        }    
    }
}