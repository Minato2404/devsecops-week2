pipeline {
    agent {
        docker { image 'python:3.10-slim' }
    }

    stages {
        stage('1. Build - Install Dependencies') {
            steps {
                echo "Membuat virtual environment dan menginstall dependensi..."
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
                sh '''
                    . venv/bin/activate
                    PYTHONPATH=. pytest
                '''
            }
        }

        stage('3. Security Scan - Bandit') {
            steps {
                echo "Menjalankan security scan..."
                // Menambahkan '|| true' agar build tidak gagal jika ada temuan
                sh '''
                    . venv/bin/activate
                    bandit -r src || true
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
