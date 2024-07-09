pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t my-python-web-app .'
                }
            }
        }
        stage('Login to DockerHub') {
            steps {
                script {
                    // Replace with your DockerHub username and password
                    withCredentials([string(credentialsId: 'dockerhub-username', variable: 'DOCKERHUB_USERNAME'), 
                                     string(credentialsId: 'dockerhub-password', variable: 'DOCKERHUB_PASSWORD')]) {
                        sh "echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin"
                    }
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    // Push Docker image to DockerHub
                    sh 'docker tag my-python-web-app:latest your-dockerhub-username/my-python-web-app:latest'
                    sh 'docker push your-dockerhub-username/my-python-web-app:latest'
                }
            }
        }
    }
}
