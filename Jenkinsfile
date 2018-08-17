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
        scripts {
          docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_creds') {
            sh 'docker push $docker_user/helloworld:latest'
          }
        }
      }
    }
  }
}

/*
pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
}
*/
