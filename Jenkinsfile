pipeline {
    agent any

    tools {
        // Pastikan nama ini sama dengan yang Anda set di Manage Jenkins > Tools
        python 'Python3.10'
    }

    stages {
        // Langsung mulai ke tahap Build, karena checkout sudah dilakukan otomatis oleh Jenkins.

        stage('1. Build - Install Dependencies') {
            steps {
                echo "Menginstall dependensi dari requirements.txt..."
                sh 'pip install -r requirements.txt'
            }
        }
        stage('2. Test - Unit Tests') {
            steps {
                echo "Menjalankan unit tests..."
                sh 'pytest'
            }
        }
        stage('3. Security Scan - Bandit') {
            steps {
                echo "Menjalankan security scan..."
                sh 'bandit -r src'
            }
        }
        stage('4. Deploy to Staging') {
            when {
                branch 'main'
            }
            steps {
                echo ' Deploying application to staging...'
            }
        }
    }
}
