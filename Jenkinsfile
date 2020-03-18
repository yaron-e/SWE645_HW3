pipeline {
  //Stage 1 : Build the docker image.
  agent {
      docker { image 'node:7-alpine' }
  }
  stages {
    stage('Build image') {
      steps {
        sh("docker build -t ${imageTag} .")
      }
    }
  }
}
