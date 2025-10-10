pipeline {
    agent any

    stages {
        // Stage 0: Menyiapkan lingkungan dengan menginstal Python
        stage('0. Setup Environment') {
            steps {
                echo "Installing Python and PIP..."
                // Menjalankan perintah di dalam 'agent' (server Jenkins)
                // apt-get adalah package manager untuk sistem operasi Debian/Ubuntu
                sh 'apt-get update -y'
                sh 'apt-get install -y python3 python3-pip'
                sh 'python3 --version' // Memeriksa versi untuk memastikan instalasi berhasil
            }
        }

        stage('1. Build - Install Dependencies') {
            steps {
                echo "Menginstall dependensi..."
                // Menggunakan pip3 karena itu yang kita install
                sh 'pip3 install -r requirements.txt'
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
