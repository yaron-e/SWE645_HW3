pipeline {
  //Stage 1 : Build the docker image.
  agent {
      docker { image 'node:7-alpine' }
  }
  stage('Build image') {
      sh("docker build -t ${imageTag} .")
  }
}
