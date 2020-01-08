pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo '从GitHub下载项目源码'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '59b3db94-04cd-4317-8efd-cdf70d9e5e44', url: 'https://github.com/Czkl/simple-java-maven-app.git']]])
            }
        }
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn -B -DskipTests clean package'
                sh 'pwd'
                sh 'ls ./target'
            }
        }
        stage('test') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
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
            agent{
                docker{
                    image 'docker'
                    args '-v /var/jenkins_home/workspace/simple-java-maven-app/target/my-app-1.0-SNAPSHOT.jar:/app.jar'
                }
            }
            steps {
                sh 'ls'
                sh './jenkins/scripts/deliver.sh'
                sh 'docker --version'
            }
        }
    }
}