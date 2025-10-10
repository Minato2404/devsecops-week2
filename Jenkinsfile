pipeline {
    agent any

    stages {
        stage('0. Setup Environment') {
            steps {
                echo "Installing Python and PIP with admin rights..."
                // Menambahkan 'sudo' untuk memberikan hak akses administrator
                sh 'sudo apt-get update -y'
                sh 'sudo apt-get install -y python3 python3-pip'
                sh 'python3 --version'
            }
        }

        stage('1. Build - Install Dependencies') {
            steps {
                echo "Menginstall dependensi..."
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
