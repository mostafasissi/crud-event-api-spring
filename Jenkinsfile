pipeline {
    agent any
    tools {
        maven 'maven_3_8_1'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mostafasissi/crud-event-api-spring.git']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script {
                   sh 'docker build -t mostafasissi/eventcrudapi .'
                }
            }
        }
        stage('Push docker image'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u mostafasissi -p ${dockerhubpwd}'
                    }
                    sh 'docker push mostafasissi/eventcrudapi'
                }
            }
        }
    }
}