
pipeline {
    agent any

    tools {
        
  jdk 'jdk'
  git 'Default'
  maven 'maven'
  dockerTool 'docker'
    }
    

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker') // Jenkins credentials ID for Docker Hub
        DOCKER_IMAGE_NAME = 'smitwaman/webapp' // Docker Hub repository name
        DOCKER_IMAGE_TAG = "${env.BUILD_NUMBER}" // Tagging the Docker image with the Jenkins build number
        
    }

    

    stages{
        stage('scm') {
            steps {
                // Clone your HTML project from version control
                git branch: 'main', url: 'https://github.com/smitwaman/task-management-system.git'

                // You might have additional build steps here if needed
            }
        }


    
        stage('Start Docker Daemon') {
            steps {
                script {
                    sh 'sudo -i'
                    sh 'apt install systemctl'
                    sh 'systemctl start docker'
                    
                }  
            }
        }
        

        stage('Build Docker Image') {
            steps {
                // Build Docker image with Dockerfile
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                // Log in to Docker Hub
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                            // Push Docker image to Docker Hub
                            docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").push()
                        }
                    }
                }
            }
        }
    }
}

