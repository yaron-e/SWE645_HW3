pipeline {
    agent any
    environment {
        PROJECT_ID = 'PROJECT-ID'
        CLUSTER_NAME = 'CLUSTER-NAME'
        LOCATION = 'CLUSTER-LOCATION'
        CREDENTIALS_ID = 'swe645'//'gke'
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        /*stage("Build image") {
            steps {
                script {
                    myapp = docker.build("eyaron94/swe645_2:latest")
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
        }   */     
        stage('Deploy to GKE') {
            steps{
                sh "sed -i 's/swe645_2:latest/swe645_2:${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }    
}

/*pipeline {
  //Stage 1 : Build the docker image.
  agent any
  stages {
    stage('Build image') {
      steps {
        //sh('sudo apt-get update -y && sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y')
        //sh('curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -')
        //sh('sudo apt-key fingerprint 0EBFCD88')
        //sh('add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"')
        //sh('sudo apt-get install docker-ce docker-ce-cli containerd.io')
        sh("docker build -t samplewar .")
        sh('docker run -p 5000:8080 samplewar')
        sh('docker container ls')
      }
    }
   //def customImage = docker.build("my-image:mywebapp")//def customImage = docker.build("my-image:")
    //Stage 2 : Push the image to docker registry
  stage('Push image to registry') {
     steps {       
            withEnv(['PATH=/root/google-cloud-sdk/bin']) {
                sh("gcloud docker -- push samplewar")
            }
       
          //withEnv(['GCLOUD_PATH=/var/jenkins_home/google-cloud-sdk/bin']) {
         //       sh("gcloud docker -- push samplewar")
        //    }
       //
    }
  }
  
  }
}*/

