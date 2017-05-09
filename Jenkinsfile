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
    
  
        
        stage('Build IRIS war') {
            steps {
               echo 'Building..'
               
               bat 'mvn -B -o -f %PACKAGE_PREFIX%-iris-parent/pom.xml -Dmaven.repo.local=%MAVEN_LOCAL_REPO% install'
               
               step([$class: 'ArtifactArchiver', artifacts: '**/target/*.war', fingerprint: true])
            }
        }       

        
         
    }
}