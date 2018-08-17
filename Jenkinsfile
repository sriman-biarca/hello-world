pipeline {
  agent any
  stages {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh 'mvn clean package'
      }
    }
    stage('Docker Build') {
      steps {
        app = docker.build("$docker_user/helloworld:latest")
      }
        
//      steps {
//        sh 'docker build -t $docker_user/helloworld:latest .'
//      }
    }
    stage('Push image') {
      steps {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_creds') {
          app.push("${env.BUILD_NUMBER}")
          app.push("latest")
        }
      }
    }
  }
}
