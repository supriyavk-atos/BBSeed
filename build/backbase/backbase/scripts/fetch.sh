#!/usr/bin/env bash
# fetches all required packages and copies them to the ROOT folder

ROOT='../cache/'

# creates the root folder if it does not exist
if [[ ! -e $ROOT ]]; then
    mkdir $ROOT
fi

# removes files from the root folder if 'clean' is passed as parameter to the shell script
if [[ $1 == "clean" ]]; then
    echo "Refreshing cache in progress...\n"
    rm $ROOT*
fi

download() {
    # if the requested file does not exist in the root folder
    if [[ ! -e $ROOT$2 ]]; then
        # if a header string is specified for the download
        if [[ $3 ]]; then
            # download using the specified HTTP header
            wget --header "$3" -O $ROOT$2 $1$2
        else
            # download without an HTTP header
            wget -O $ROOT$2 $1$2
        fi
    fi
}


# download the following files to the root folder if they do not exist
download "http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.67/bin/" "apache-tomcat-7.0.67.zip"
download "http://download.oracle.com/otn-pub/java/jdk/7u80-b15/" "jdk-7u80-linux-x64.rpm" "Cookie: oraclelicense=accept-securebackup-cookie"
#Community links
download "http://dev.mysql.com/get/Downloads/MySQL-5.7/" "mysql-community-client-5.7.10-1.el7.x86_64.rpm"
download "http://dev.mysql.com/get/Downloads/MySQL-5.7/" "mysql-community-common-5.7.10-1.el7.x86_64.rpm"
download "http://dev.mysql.com/get/Downloads/MySQL-5.7/" "mysql-community-server-5.7.10-1.el7.x86_64.rpm"
download "http://dev.mysql.com/get/Downloads/MySQL-5.7/" "mysql-community-libs-5.7.10-1.el7.x86_64.rpm"
download "http://dev.mysql.com/get/Downloads/MySQL-5.7/" "mysql-community-libs-compat-5.7.10-1.el7.x86_64.rpm"
download "http://dev.mysql.com/get/Downloads/MySQL-5.7/" "mysql-community-embedded-5.7.10-1.el7.x86_64.rpm"
download "http://pkgs.repoforge.org/rpmforge-release/" "rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "wandisco-git-release-7-1.noarch.rpm"
download "http://opensource.wandisco.com/centos/7/git/x86_64/" "git-2.4.1-1.WANdisco.259.x86_64.rpm"
download "http://archive.apache.org/dist/maven/maven-3/3.3.3/binaries/" "apache-maven-3.3.3-bin.zip"
# Download files required for Backbase setup
#H2 DB Driver
download "http://central.maven.org/maven2/com/h2database/h2/1.3.154/" "h2-1.3.154.jar"
# mysql-connector jar
download "https://github.com/atosorigin/fin_backbase_demo/raw/master/deploy/bronze/" "mysql-connector-java-5.1.9.jar"




