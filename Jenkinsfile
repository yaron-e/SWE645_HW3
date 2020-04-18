pipeline {
   agent any


        tools {
          // Install the Maven version configured as "M3" and add it to the path.
          maven "Maven 3.6.3"
          }
    environment {
        PROJECT_ID = 'extreme-citadel-271521'
        CLUSTER_NAME = 'swe645'
        LOCATION = 'us-east1-c'
        CREDENTIALS_ID = 'gke'
    }
    stages {
        stage("Checkout code") {
            steps {
                sh 'ls'
                sh 'git clone https://github.com/eidelmand/swe645-frontend.git'
                sh 'git clone https://github.com/eidelmand/swe645-backend.git'
                sh 'ls'
            }
        }
        stage("Build backend") {
          steps {
              sh 'cd swe645-backend'
              sh 'mvn -B clean package'
              sh 'ls'
              sh 'mv target/*-SNAPSHOT.war Backend.war'
              myapp = docker.build("eyaron94/swe645_backend:${env.BUILD_ID}")
          }
        }
        stage("Build frontend"){
          steps{
            sh 'cd ../swe645-frontend'
            myapp2 = docker.build("eyaron94/swe645_frontend:${end.BUILD_ID}")
          }
        }
        stage("Push images") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            //myapp.push("${env.BUILD_ID}")
                            myapp2.push("latest")
                            //myapp2.push("${env.BUILD_ID}")
                    }
                }
            }
        }
        stage('Deploy to GKE') {
            steps{
		    sh 'gcloud config set project extreme-citadel-271521'
		    sh 'gcloud container clusters get-credentials swe645 --zone us-east1-c'

		    sh 'kubectl set image deployments/swe645-backend swe645-backend=eyaron94/swe645_backend:latest'
        sh 'kubectl set image deployments/swe645-frontend swe645-frontend=eyaron94/swe645_frontend:latest'

      }
        }
    }
}
