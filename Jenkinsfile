pipeline {
    agent any
    stages {
        stage('Sent message about starting deploy') {
            steps {
                sh 'curl -s -X POST https://api.telegram.org/bot6577969539:AAFJHQTZ04x5WrtKVue2YfDuNAo-Rppx7YE/sendMessage -d chat_id=-1001986252630 -d parse_mode="Markdown" -d text="Starting deployment"'
            }
        }

        
        stage('Build image') {
            steps {
              script {
                   docker.build('assug-site-card')
                 }
            }
        }
        
        stage('Recretate container') {
            steps {
                sh 'docker compose up -d --force-recreate'
            }
        }

        stage('Test') {
            steps {
                sh 'curl 192.168.10.11:80'
            }
        }
        
        stage('Sent message about finishing deploy') {
            steps {
                sh 'curl -s -X POST https://api.telegram.org/bot6577969539:AAFJHQTZ04x5WrtKVue2YfDuNAo-Rppx7YE/sendMessage -d chat_id=-1001986252630 -d parse_mode="Markdown" -d text="Success deployment"'
            }
        } 
    }
}
