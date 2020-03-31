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
                    /*docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }*/
                    docker.withRegistry('','dockerhub'){
                    myapp.push()
                }
            }
        }
        stage('Deploy to GKE') {
            steps{
                /*withKubeConfig([
                  credentialsId: '7a1146c7-1791-4197-a8fd-f6a97abec862'
                  // , contextName: contextName
                ]) {
                    // switch context from default to target environment
                    sh "kubectl config use-context ${contextName}"
                    // deploy the resources (without pushing)
                    sh 'kubectl apply -k .'
                    // wait for deployment to complete
                    sh "kubectl rollout status deployment/${projectName} --timeout=2m"
                }*/


                //sh 'docker pull eyaron94/swe645_3'
                //sh 'docker run -p 5000:8080 eyaron94/swe645_3'
                //sh "sed -i 's/swe645_3:latest/swe645_3:${env.BUILD_ID}/g' deployment.yaml"
                //step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
                sh'''
                    #!/bin/bash
                    docker login
                    docker pull eyaron94/swe645_3:${env.BUILD_ID}
                    sudo -s source /etc/environment
                    kubectl --kubeconfig /home/edaniela2010/.kube/config set image deployment swe645 swe645-group=docker.io/swe645docker/swe645-group:$BUILD_NUMBER
    				        //docker rmi -f eyaron94/swe645_3:${env.BUILD_ID}
			           '''
            }
        }
    }
}
