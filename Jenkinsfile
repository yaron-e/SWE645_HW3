/*pipeline {
  //Stage 1 : Build the docker image.
  agent { dockerfile true}
  stages {
    stage('Build image') {
      steps {
     //   sh('apt-get update -y && apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y')
        sh('echo Hello')
        
      }
    }
   def customImage = docker.build("my-image:mywebapp")//def customImage = docker.build("my-image:")
    
  }
}
*/
node {
    checkout scm

    def customImage = docker.build("my-image:mywebapp}")

    customImage.inside {
        sh 'make test'
    }
}
