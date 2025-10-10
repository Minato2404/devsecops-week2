pipeline {
    // Memberitahu Jenkins untuk menjalankan semua langkah di dalam container Docker
    // yang sudah memiliki Python 3.10.
    agent {
        docker { image 'python:3.10-slim' }
    }

    stages {
        // Stage Setup tidak diperlukan lagi karena Python sudah tersedia.

        stage('1. Build - Install Dependencies') {
            steps {
                echo "Menginstall dependensi..."
                // Di dalam container ini, perintahnya adalah 'pip'
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
                echo '🚀 Deploying application to staging...'
            }
        }
    }
}
