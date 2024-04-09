// Install Credentials and Credentials Binding Plugin
pipeline {
    agent any
    parameters {
        // string(name: 'VERSION', defaultValue: '', description: "lol")
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: 'huihui')
        booleanParam(name: 'executeTests', defaultValue: true, description:'hmmm')
    }
    tools {
        // maven // gradel
        maven 'Maven'
    }
    environment {
        NEW_VERSION = '1.0.1'
        //by installting credentails binding plugin
        //add id of the creditals
        SERVER_CREDENTIALS = credentials('student-creds')
    }
    stages {
        stage('init') {
            steps {
                script {
                    groovy = load 'script.groovy'
                }
            }
        }

        stage('build') {
            steps {
                script {
                    groovy.buildApp()
                }
                sh 'mvn install'
                sh 'npm install'
                echo 'building the application...'
                echo "builing version ${NEW_VERSION}"
            }
        }
        stage('test') {
            when {
                expression {
                    // params.executeTests == true
                    params.executeTests
                }
            }
            steps {
                script {
                    groovy.testApp()
                }
                echo 'testing the application...'
            }
        }
        stage('deploy') {
            stage {
                // echo 'deploying the application...'
                // echo "deploying version ${params.VERSION}"
                script {
                    groovy.deployApp()
                }
                withCredentials([
                    usernamePassword(
                        credentials: 'server-credentials',
                        usernameVariable: USER,
                        passwordVariable: PWD
                    )
                ]) {
                    sh "sompt ${USER} ${PWD}"
                }
            }
        }
    }
}
