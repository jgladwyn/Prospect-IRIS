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
    
         stage('Deploy to GitLab (DS Package + IRIS war)') {
            steps {
                echo 'Deploying....'    
                echo "${env.WORKSPACE}"


                withEnv(["PATH+GIT=C:\\apps\\git\\bin"]) {
                    dir('remote-cloud-t24') {
                        deleteDir()
                        bat "git clone https://1bm2kcjgf09og:12AB3NzaC1yc2EAfra@gitlab.temenos.cloud/1bm2kcjgf09og/corebanking/ ."
                    }
                    echo 'Copy Package ....'
    
                    bat "xcopy %PACKAGE_PREFIX%-packager\\target\\*.jar remote-cloud-t24\\packages /Y"
                    
                    echo 'Copy IRIS war ....'
                    bat "xcopy %PACKAGE_PREFIX%-iris\\target\\*.war remote-cloud-t24\\plugins /Y"
                
                    echo 'Git commands....'
                    
                    // setup git config
                    bat "git config --global user.name \"David Aguirre\""
                    bat "git config --global user.email \"daguirre@temenos.com\""
                    bat "git config --global push.default simple"

                    // add jar/war + commit
                    bat "git --git-dir=remote-cloud-t24/.git --work-tree=remote-cloud-t24 add *.jar"
                    bat "git --git-dir=remote-cloud-t24/.git --work-tree=remote-cloud-t24 add *.war"
                    bat "git --git-dir=remote-cloud-t24/.git --work-tree=remote-cloud-t24 commit -m\"New DS package\""

                    // push changes                    
                    bat "git --git-dir=remote-cloud-t24/.git --work-tree=remote-cloud-t24 push --set-upstream origin master"
                }                

            }
        }  
        
         
    }
}