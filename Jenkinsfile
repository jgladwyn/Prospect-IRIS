#!/usr/bin/env groovy

pipeline {
    agent any

    tools { 
        maven 'Maven 3.3.9' 
        jdk 'JDK 1.8' 
        git 'GIT'
    }
    
    environment { 
        MAVEN_LOCAL_REPO = 'C:/DS/DesignStudioT24-201702.5/t24-binaries'
        T24_HOME_PACKAGE = 'C:/UTP/Daily_UTP_minimal/Temenos/t24home/default/package'
        T24_HOME = 'C:/UTP/Daily_UTP_minimal/Temenos/t24home/default'
        TAFJ_HOME = 'C:/UTP/Daily_UTP_minimal/Temenos/TAFJ'
        JAVA_HOME = 'C:/UTP/Daily_UTP_minimal/Temenos/java/jdk-7u76-windows-x64'
        
        PACKAGE_PREFIX = 'Prospect'
        
    }
    stages {
    

        stage('Clean') {
            steps {
               echo 'Cleaning..'
               
               bat 'mvn -B -o -f %PACKAGE_PREFIX%-packager/module/pom.xml -Dmaven.repo.local=%MAVEN_LOCAL_REPO% -Dds.ignoreValidationErrors=true clean'
               
               bat 'mvn -B -o -f %PACKAGE_PREFIX%-iris-parent/pom.xml -Dmaven.repo.local=%MAVEN_LOCAL_REPO% clean'
            }
        } 
           
        stage('Build DS Package') {
            steps {
               echo 'Building..'
               
               bat 'mvn -B -o -f %PACKAGE_PREFIX%-packager/module/pom.xml -Dmaven.repo.local=%MAVEN_LOCAL_REPO% -Dds.ignoreValidationErrors=true install'
               
               step([$class: 'ArtifactArchiver', artifacts: '**/target/*.jar', fingerprint: true])
            }
        }
        
        stage('Unit tests') {
            steps {
                echo 'Testing..'
            }
        }

        
        stage('Integration test') {
            steps {
                echo 'Testing on server..'
            }
        }
 
   stage('Deploy DS Package to Cloud test env') {
            steps {
                echo 'Deploying....'    
                
                dir('remote-cloud-t24') {
                    bat "git clone https://1bm2kcjgf09og:12AB3NzaC1yc2EAfra@gitlab.temenos.cloud/1bm2kcjgf09og/corebanking/ ."
                }
                
                // bat 'mkdir remotegit'
                echo "${env.WORKSPACE}"

                echo 'Copy Package ....'

                bat "xcopy %PACKAGE_PREFIX%-packager\\target\\*.jar remote-cloud-t24\\packages /Y"

                withEnv(["PATH+GIT=C:\\apps\\git\\bin"]) {
                    echo 'Git commands....'
                    
                    // setup git config
                    bat "git config --global user.name \"David Aguirre\""
                    bat "git config --global user.email \"daguirre@temenos.com\""
                    bat "git config --global push.default simple"

                    // add jar + commit
                    bat "git --git-dir=remote-cloud-t24/.git --work-tree=remote-cloud-t24 add *.jar"
                    bat "git --git-dir=remote-cloud-t24/.git --work-tree=remote-cloud-t24 commit -m\"New DS package\""

                    // push changes                    
                    bat "git --git-dir=remote-cloud-t24/.git --work-tree=remote-cloud-t24 push --set-upstream origin master"
                }                

            }
        }  
    }
}