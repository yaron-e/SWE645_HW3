pipeline {
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
      }
    }
   //def customImage = docker.build("my-image:mywebapp")//def customImage = docker.build("my-image:")
    //Stage 2 : Push the image to docker registry
  stage('Push image to registry') {
     steps {
            withEnv(['GCLOUD_PATH=/var/jenkins_home/google-cloud-sdk/bin']) {
                sh("gcloud docker -- push samplewar")
            }
    }
  }
  
  
}

