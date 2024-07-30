pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS_ID = 'dockerhub-id'  // Replace with your DockerHub credentials ID
        DOCKER_IMAGE_NAME = 'my-python-image25'   // Your Docker image name
        DOCKERHUB_USERNAME = 'devopseasylearning'  // Your DockerHub username
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image specifying the Dockerfile path
                    docker.build("${DOCKER_IMAGE_NAME}", "-f smartedu/Dockerfile .")
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    // Login to DockerHub
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS_ID}", usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Tag the Docker image
                    sh "docker tag ${DOCKER_IMAGE_NAME} ${DOCKERHUB_USERNAME}/${DOCKER_IMAGE_NAME}:latest"

                    // Push the Docker image to DockerHub
                    sh "docker push ${DOCKERHUB_USERNAME}/${DOCKER_IMAGE_NAME}:latest"
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker images
            sh 'docker image prune -af'
        }
    }
}
