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
        sh 'mvn -B -DskipTests clean package'
      }
    }
    stage('Docker Build') {
      steps {
        sh 'docker build -t $docker_user/helloworld:latest .'
      }
    }
        
//      steps {
//        sh 'docker build -t $docker_user/helloworld:latest .'
//      }

    /* stage('Push image') {
      when {
        branch 'master'
      }
      steps {
        withDockerRegistry([ credentialsId: "dockerhub_creds", url: "" ]) {
          sh 'docker push brightbox/terraform:latest'
        }
      }
    }*/
    stage('Push image') {
      steps {
        withDockerRegistry([credentialsId: 'dockerhub_creds', url: "https://registry.hub.docker.com"]) {
          sh 'docker tag helloworld $docker_user/helloworld'
          sh 'docker push $docker_user/helloworld:latest'
        }
      }
    }
  }
}

/*
    stage('Push image') {
      steps {
        scripts {
          withDockerRegistry([credentialsId: 'dockerhub_creds', url: "https://hub.docker.com"]) {
            sh 'docker push $docker_user/helloworld:latest'
          }
        }
      }
    }
*/
