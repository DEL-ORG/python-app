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
                    def buildImage = docker.build("${DOCKER_IMAGE_NAME}", "-f smartedu/Dockerfile .")
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    // Login to DockerHub
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS_ID}") {
                        // DockerHub login is handled by the withRegistry block
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Tag the image
                    def tag = "${DOCKERHUB_USERNAME}/${DOCKER_IMAGE_NAME}:latest"
                    docker.image("${DOCKER_IMAGE_NAME}").tag(tag)

                    // Push the image to DockerHub
                    docker.image(tag).push()
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
