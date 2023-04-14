node{
    

echo "the job name is : ${JOB_NAME}"
echo "the build no is : ${BUILD_NUMBER}"

properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])
def mavenHome = tool name: 'maven 3.9.0'

stage('checkout'){
git branch: 'development', credentialsId: '003bae02-0e44-44dd-9a28-46df14c8aa77', url: 'https://github.com/rahulns1993/maven-web-application.git'
}//stage close

stage('build')
{
sh "${mavenHome}/bin/mvn clean package"

}
stage('sonarqubereport')
{
sh "${mavenHome}/bin/mvn clean sonar:sonar"

}

stage('uploadArtifactIntoNexus')
{
sh "${mavenHome}/bin/mvn clean deploy"
}
stage('DEplyAppIntoTomcat')
{sshagent(['3936fc71-cd4d-4c2a-a124-86b9f5fe6088']) {
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.34.124:/opt/apache-tomcat-9.0.73/webapps"
}


}
    
    
    
}//node
