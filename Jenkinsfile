pipeline {
    agent any

    stages {
        stage('1. Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/NAMA_USER/NAMA_REPO.git'
            }
        }
        stage('2. Build - Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('3. Test - Unit Tests') {
            steps {
                sh 'pytest'
            }
        }
        stage('4. Security Scan - Bandit') {
            steps {
                sh 'bandit -r src'
            }
        }
        stage('5. Deploy to Staging') {
            steps {
                echo '🚀 Deploying application to staging...'
            }
        }
    }
}
