pipeline {
    agent  any/*{docker {
            image 'maven:3.6.2-jdk-8'
            args '-v /root/.m2:/root/.m2'
        }}*/
        tools {
          // Install the Maven version configured as "M3" and add it to the path.
          maven "Maven 3.6.3"
          }
    environment {
        PROJECT_ID = '654482500446'
        CLUSTER_NAME = 'swe645'
        LOCATION = 'us-east1-c'
        CREDENTIALS_ID = 'gke'
    }
    stages {
        /*stage("Checkout code") {
            steps {

            }
        }*/
        stage("Build image") {
            steps {
                script {

                    checkout scm
                    sh 'ls'
                    sh 'mvn -B clean package'
                    sh 'ls target/'
                    sh 'mv target/test1-0.0.1-SNAPSHOT.war swe645.war'
                    myapp = docker.build("eyaron94/swe645_3:${env.BUILD_ID}")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
        stage('Deploy to GKE') {
            steps{
                //withEnv(['kubectl=/google/google-cloud-sdk/bin/kubectl'])
                sh "sed -i 's/swe645_3:latest/swe645_3:${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }
}
