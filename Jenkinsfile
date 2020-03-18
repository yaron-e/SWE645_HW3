pipeline {
  //Stage 1 : Build the docker image.
  agent any
  stages {
    stage('Build image') {
      steps {
        sh('apt-get update && apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common')
      }
    }
  }
}
