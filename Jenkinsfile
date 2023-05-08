pipeline{
    agent any
    stages{
        stage("first"){
            steps {
                echo 'hello world'
            }
        }
        stage("deploy"){
            steps {
                sh "chmod +x bin/deploy.sh"
                sh 'pwd'
                sh 'ls'
            }
        }
        stage("run test"){
            steps {
                echo 'run test'
            }
        }
    }
    post{
        always{
            echo 'always say goodbay'
        }
    }
}
