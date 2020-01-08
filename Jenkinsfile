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
        stage('构建docker镜像') {
            agent {
                docker {
                    image 'docker'
                    // 这里的挂载比较奇怪，因为在上一步maven构建完成之后并没有生成target(现在想来可能是docker的缘故)，
                    // 所以把本地的maven仓库给挂载进来获取jar包使用了
                    args '-v /var/jenkins_home/workspace/pipeline-demo/target:/root/jar'
                }
            }
            steps {
                sh '''
                    cp /root/jar/my-app-1.0-SNAPSHOT.jar /my-app-1.0-SNAPSHOT.jar
                    cd docker
                    docker build -t my-app-1.0-SNAPSHOT .
                '''
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
                sh 'docker --version'
            }
        }
    }
}