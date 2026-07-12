pipeline{
    agent any;

    stages{
        stage('Checkout code'){
            steps{
                checkout scm
            }
        }
        stage('Listing files'){
            steps{
                sh 'ls'
            }
        }
    }
}