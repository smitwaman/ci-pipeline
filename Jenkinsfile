
pipeline {
    agent any

    tools {
        
  jdk 'jdk'
  maven 'maven'
  dockerTool 'docker'
    }
    

    environment {
        DOCKER_HUB_REGISTRY = 'docker.io' // Docker Hub registry URL
        DOCKER_HUB_USERNAME = 'smitwaman' // Your Docker Hub username
        DOCKER_HUB_REPOSITORY = 'webapp' // Your Docker Hub repository name
        DOCKER_IMAGE_TAG = 'latest' // Tag for the Docker image
       }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

     

        stage('Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPOSITORY}:${DOCKER_IMAGE_TAG} ."
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub using Personal Access Token
                    withCredentials([string(credentialsId: 'docker', variable: 'DOCKER_LOGIN_TOKEN')]) {
                        sh "docker login -u ${env.DOCKER_HUB_USERNAME} -p ${env.DOCKER_LOGIN_TOKEN} ${env.DOCKER_HUB_REGISTRY}"
                    }

                    // Push Docker image to Docker Hub
                    sh "docker push ${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPOSITORY}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
}
