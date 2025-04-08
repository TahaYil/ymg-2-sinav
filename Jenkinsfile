pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        PATH = "/Applications/Docker.app/Contents/Resources/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin"
        IMAGE_NAME = "deneme-image"
        CONTAINER_NAME = "test-nginx"
    }

    stages {
        stage('Repo Klonla') {
            steps {
                git url: 'https://github.com/TahaYil/ymg-2-sinav.git', branch: 'main'
            }
        }

        stage('Docker Image Oluştur') {
            steps {
                echo "Docker image oluşturuluyor..."
                
                sh "docker build -t ${IMAGE_NAME} ."
                
            }
        }

        stage('Konteyner Durdur') {
            steps {
                echo "Var olan konteyner durduruluyor (eğer varsa)..."
                sh "docker rm -f ${CONTAINER_NAME} || true"
            }
        }

        stage('Konteyner Oluştur') {
            steps {
                echo "Yeni konteyner oluşturuluyor..."
                sh "docker run -d --name ${CONTAINER_NAME} -p 4444:80 ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo "Pipeline başarıyla tamamlandı!"
        }
        failure {
            echo "Pipeline başarısız oldu!"
        }
    }
}
