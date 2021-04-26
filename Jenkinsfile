pipeline {

    // environment {
    //     registry = "rishabhprasad03/ense375group-a"
    //     registryCredential = 'dockerhub'
    //     dockerImage = '';
    // }

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
            sh 'docker build -t 491551051/ense375-final:1.0.0'
        }

        stage('Push Docker image') {
            withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                sh "docker login -u 491551051 -p ${dockerHubPwd}"
            }
            sh 'docker push 491551051/ense375-final:1.0.0'
        }
    }

}
