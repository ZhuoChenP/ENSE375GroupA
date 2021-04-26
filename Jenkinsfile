pipeline {

    environment {
        registry = "zhuochenp/ense375-final:1.0.0"
        registryCredential = 'dockerHub'
        dockerImage = '';
    }

    agent any
    stages {

        stage('Checkout Codebase'){
            steps{
                cleanWs()
                checkout scm: [$class: 'GitSCM', branches: [[name: '*/master']],userRemoteConfigs:
                [[credentialsId: 'github-ssh-key', url: 'https://github.com/ZhuoChenP/ENSE375GroupA.git']]]
            }
        }

        stage('Build'){
                   steps{  
                sh 'mvn compile -f RiskMeter/pom.xml'               
                   }
        }

        stage('Test'){
                  steps{ 
                sh 'mvn test -f RiskMeter/pom.xml'              
                  }
        }
        
        stage('Building image') {
            steps{ 
                    script {
                    dockerImage = docker.build registry
                }
            }
        }

        stage('Push Docker image') {
            steps{
                script{
                    docker.withRegistry( '', registryCredential) {
                    dockerImage.push()
                    }
                }
             }
        }
    }

}
