pipeline {
  //Stage 1 : Build the docker image.
  agent {
      dockerfile true
  }
  stages {
    stage('Build image') {
      steps {
        sh("docker ps")
      }
    }
  }
}
