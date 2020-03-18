pipeline {
  //Stage 1 : Build the docker image.
  agent {
      any//dockerfile true
  }
  stages {
    stage('Build image') {
      steps {
        sh('echo hello')
      }
    }
  }
}
