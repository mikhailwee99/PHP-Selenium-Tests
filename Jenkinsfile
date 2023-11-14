pipeline {
	agent none
	stages {
		stage('Integration UI Test') {
			parallel {
				stage('Deploy') {
					agent any
					steps {
						sh "cd home"
						sh "chmod -R ./php-selenium-tests/src"
						sh "cd php-selenium-tests"
						sh "chmod +x ./jenkins/scripts/deploy.sh"
						sh "chmod +x ./jenkins/scripts/kill.sh"
						sh './jenkins/scripts/deploy.sh'
						input message: 'Finished using the web site? (Click "Proceed" to continue)'
						sh './jenkins/scripts/kill.sh'
					}
				}
				stage('Headless Browser Test') {
					agent {
						docker {
							image 'maven:3-alpine' 
							args '-v /root/.m2:/root/.m2' 
						}
					}
					steps {
						sh 'mvn -B -DskipTests clean package'
						sh 'mvn test'
					}
					post {
						always {
							junit 'target/surefire-reports/*.xml'
						}
					}
				}
			}
		}
	}
}

docker run --name jenkins-docker --detach 
  --privileged --network jenkins --network-alias docker 
  --env DOCKER_TLS_CERTDIR=/certs 
  --volume jenkins-docker-certs:/certs/client 
  --volume jenkins-data:/var/jenkins_home 
  --volume "C:\Users\mikha\Desktop\PHP":/home 
  --publish 3000:3000 --publish 5000:5000 --publish 2376:2376 --publish 80:80 
  docker:dind 