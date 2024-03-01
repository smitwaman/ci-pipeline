# Continuous Integration Pipeline 
 This is project simple-pipeline for continuous integration using 
 1. github webhook and git as a scm.
 2. Jenkins for configure tools and script generate.
 3. Docker is for dockerize code and push it to dockerhub.

Any commit in scm will make webhook to trigger pipeline.

Github-Git-Jenkins-Maven-Docker-Dockerhub

# PUSH based approach 
![Pipeline stages o/p](https://github.com/smitwaman/ci-pipeline/blob/main/image/ci.jpg)



# task-management-system
It is simple html program for task-management-system having fields as task, assignee, time.

For running webproject

$ sudo docker pull smitwaman/task-management-system:v1

$ sudo docker run -d -p 8080:80 task-management-system:v1         

![docker o/p](https://github.com/smitwaman/ci-pipeline/blob/main/image/docker.png)




// you can use any free port instead of 8080

Browse html using http://localhost:8080
![Browser o/p](https://github.com/smitwaman/ci-pipeline/blob/main/image/browser.png)

