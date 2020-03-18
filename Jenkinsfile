pipeline {
  //Stage 1 : Build the docker image.
  agent any
  stages {
    stage('Build image') {
      steps {
        sh('apt-get update -y && apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y')
        sh('curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -')
        sh('apt-key fingerprint 0EBFCD88')
        sh('add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"')
        sh('apt-get install docker-ce docker-ce-cli containerd.io')
      }
    }
   //def customImage = docker.build("my-image:mywebapp")//def customImage = docker.build("my-image:")
    
  }
}

