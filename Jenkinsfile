pipeline {
    agent {
        docker { image 'python:3.10-slim' }
    }

    stages {
        stage('1. Build - Install Dependencies') {
            steps {
                echo "Membuat virtual environment dan menginstall dependensi..."
                // Membuat lingkungan virtual, mengaktifkannya, lalu menginstal
                sh '''
                    python -m venv venv
                    . venv/bin/activate
                    pip install -r requirements.txt
                '''
            }
        }
        
        stage('2. Test - Unit Tests') {
            steps {
                echo "Menjalankan unit tests..."
                // Menjalankan pytest dari dalam virtual environment
                sh '''
                    . venv/bin/activate
                    pytest
                '''
            }
        }

        stage('3. Security Scan - Bandit') {
            steps {
                echo "Menjalankan security scan..."
                // Menjalankan bandit dari dalam virtual environment
                sh '''
                    . venv/bin/activate
                    bandit -r src
                '''
            }
        }

        stage('4. Deploy to Staging') {
            when {
                branch 'main'
            }
            steps {
                echo '🚀 Deploying application to staging...'
            }
        }
    }
}
