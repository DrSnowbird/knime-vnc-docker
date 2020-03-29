# KNIME Analytics Platform with VNC/noVNC for Container Cluster Platforms (Openshift, Kubernetes, etc.)
[![](https://images.microbadger.com/badges/image/openkbs/knime-vnc-docker.svg)](https://microbadger.com/images/openkbs/knime-vnc-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/knime-vnc-docker.svg)](https://microbadger.com/images/openkbs/knime-vnc-docker "Get your own version badge on microbadger.com")

KNIME (latest/4.1) + Java 8 (1.8.0) OpenJDK + Maven 3.6 + Python 3.6 + PIP3 19 + + npm 6 + node 13 + Gradle 5

# Just a suggestion: If you need Python Jupyter IDE besides KNIME, you may want to check out:
* [Python Jupyter (by openkbs/tensorflow-python3-jupyter)](https://hub.docker.com/repository/docker/openkbs/tensorflow-python3-jupyter)

# Components:
* VNC/NoVNC-based Docker [KNIME Platform](https://www.knime.com/) for Use with HTML 5 Browsers from anywhere
* [KNIME Platform](https://www.knime.com/download-knime-analytics-platform-sdk) latest (v 4.1) for Machine Learning & Big Data Analytics
* Ubuntu 18.04 LTS now and we will use Ubuntu 20.04 on or about 2020-04-15 as LTS Docker base image.
* openjdk version "1.8.0_242"
  OpenJDK Runtime Environment (build 1.8.0_242-8u242-b08-0ubuntu3~18.04-b08)
  OpenJDK 64-Bit Server VM (build 25.242-b08, mixed mode)
* Apache Maven 3.6
* Python 3.6 / Python 2.7 + pip 20 + Python3 virtual environments (venv, virtualenv, virtualenvwrapper, mkvirtualenv, ..., etc.)
* Node v13 + npm 6 (from NodeSource official Node Distribution)
* Gradle 6
* Other tools: git wget unzip vim python python-setuptools python-dev python-numpy, ..., etc.

# Run (recommended for easy-start)
(Image is pulledfrom openkbs/knime-vnc-docker)
```
./run.sh
```

## Mobile devices and Desktop PC supported / tested:
* SmartPhones: tested ok! iPhone5 Safari works though phone screen size being too small vs the desired HD 1920x1080. It should work across all the smartphones with HTML5-capable brwosers. Hence, to access with small phone screen, run with VNC_RESOLUTION=800x600 (or adjust it to fit your phone's screen size).
* Tablets: tested ok! Amazon Fire with noVNC works!. It should work across all the tablets with HTML5-capable brwosers.
See [KNIME Analytics with Amazon Fire tablet](https://github.com/DrSnowbird/knime-vnc-docker/blob/master/doc/knime-vnc-docker-on-Amazon-Fire-tablet.jpeg)
* Desktop PC or MacBook: tested ok! It should work across all PCs Desktop with HTML5-capable brwosers. See [KNIME Analytics on Desktop PC Browser](https://github.com/DrSnowbird/knime-vnc-docker/blob/master/doc/knime-vnc-docker-on-Desktop-PC-Browser.png)

## Connect to VNC Viewer/Client or noVNC (Browser-based VNC)
* connect via VNC viewer localhost:5901, default password: vncpassword
* connect via noVNC HTML5 full client: http://localhost:6901/vnc.html, default password: vncpassword
* connect via noVNC HTML5 lite client: http://localhost:6901/?password=vncpassword

Once it is up, the default password is "vncpassword" to access with your web browser:
```
http://<ip_address>:6901/vnc.html,
e.g.
=> Standalone Docker: http://localhost:6901/vnc.html
=> Openshift Container Platform: http://<route-from-openshift>/vnc.html
=> Kubernetes Container Platform: (similar to the Openshift above!)
```

# Run - Override VNC environment variables 
The following VNC environment variables can be overwritten at the docker run phase to customize your desktop environment inside the container. You can change those variables using configurations CLI or Web-GUI with OpenShift, Kubernetes, DC/OS, etc.
```
VNC_COL_DEPTH, default is 24 , e.g., change to 16,
    -e VNC_COL_DEPTH=16
VNC_RESOLUTION, default: 1920x1080 , e.g., change to 1024x800
    -e VNC_RESOLUTION=1280x1024
VNC_PW, default: vncpassword , e.g., change to MySpecial!(Password%)
    -e VNC_PW=MySpecial!(Password%)
```

# Screen (Desktop) Resolution
Two ways to change Screen resolutions as below:

## 1.) Modify ./run.sh file
```
#VNC_RESOLUTION="1280x1024"
VNC_RESOLUTION="1920x1280"
```

## 2.) Customize Openshift or Kubernetes container run envionrment
```
Set up, say, VNC_RESOLUTION with value 1920x1280
```

# Build
You can build your own image locally.
```
./build.sh
```

# References
* [KNIME](https://www.knime.com)
* [KNIME Analytics Platform](https://www.knime.com/download-knime-analytics-platform-sdk)
* [KNIME FAQ](https://www.knime.com/faq#q6)

# VNC/noVNC Resources
* [VNC Viewer / Client](https://www.realvnc.com/en/connect/download/viewer/)
* [TightVNC](https://www.tightvnc.com/download.php)

# See also VNC/noVNC docker-based IDE or Analytics Platform
* [consol/ubuntu-xfce-vnc](https://hub.docker.com/r/consol/ubuntu-xfce-vnc/)
* [openkbs/eclipse-photon-vnc-docker](https://hub.docker.com/r/openkbs/eclipse-photon-vnc-docker/)
* [openkbs/knime-vnc-docker](https://hub.docker.com/r/openkbs/knime-vnc-docker/)

# See Also - docker-based IDE
* [openkbs/atom-docker](https://hub.docker.com/r/openkbs/atom-docker/)
* [openkbs/eclipse-oxygen-docker](https://hub.docker.com/r/openkbs/eclipse-oxygen-docker/)
* [openkbs/eclipse-photon-docker](https://hub.docker.com/r/openkbs/eclipse-photon-docker/)
* [openkbs/eclipse-photon-vnc-docker](https://hub.docker.com/r/openkbs/eclipse-photon-vnc-docker/)
* [openkbs/intellj-docker](https://hub.docker.com/r/openkbs/intellij-docker/)
* [openkbs/intellj-vnc-docker](https://hub.docker.com/r/openkbs/intellij-vnc-docker/)
* [openkbs/knime-vnc-docker (VNC/NoVNC)](https://hub.docker.com/r/openkbs/knime-vnc-docker/)
* [openkbs/knime-docker (X11/Desktop)](https://hub.docker.com/r/openkbs/knime-docker/)
* [openkbs/netbeans10-docker](https://hub.docker.com/r/openkbs/netbeans10-docker/)
* [openkbs/netbeans](https://hub.docker.com/r/openkbs/netbeans/)
* [openkbs/papyrus-sysml-docker](https://hub.docker.com/r/openkbs/papyrus-sysml-docker/)
* [openkbs/pycharm-docker](https://hub.docker.com/r/openkbs/pycharm-docker/)
* [openkbs/rapidminer-docker](https://cloud.docker.com/u/openkbs/repository/docker/openkbs/rapidminer-docker)
* [openkbs/scala-ide-docker](https://hub.docker.com/r/openkbs/scala-ide-docker/)
* [openkbs/sublime-docker](https://hub.docker.com/r/openkbs/sublime-docker/)
* [openkbs/webstorm-docker](https://hub.docker.com/r/openkbs/webstorm-docker/)
* [openkbs/webstorm-vnc-docker](https://hub.docker.com/r/openkbs/webstorm-vnc-docker/)

# Eclipse issues
* You might see WARNING message in the log from Eclipse for class not found. It has not impact in VNC or the KNIME tools. However, it might needs to be fixed by KNIME product team. We will not address here it for now.
```
WARNING: Aries Blueprint packages not available. So namespaces will not be registered
java.lang.NoClassDefFoundError: org/apache/aries/blueprint/NamespaceHandler
```

# Releases information
```
developer@4ae47054bb01:~$ /usr/scripts/printVersions.sh 
+ echo JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
+ java -version
openjdk version "1.8.0_242"
OpenJDK Runtime Environment (build 1.8.0_242-8u242-b08-0ubuntu3~18.04-b08)
OpenJDK 64-Bit Server VM (build 25.242-b08, mixed mode)
+ mvn --version
Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f)
Maven home: /usr/apache-maven-3.6.3
Java version: 1.8.0_242, vendor: Private Build, runtime: /usr/lib/jvm/java-8-openjdk-amd64/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "5.3.0-42-generic", arch: "amd64", family: "unix"
+ python -V
Python 2.7.15+
+ python3 -V
Python 3.6.9
+ pip --version
pip 20.0.2 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ pip3 --version
pip 20.0.2 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ gradle --version

Welcome to Gradle 6.0.1!

Here are the highlights of this release:
 - Substantial improvements in dependency management, including
   - Publishing Gradle Module Metadata in addition to pom.xml
   - Advanced control of transitive versions
   - Support for optional features and dependencies
   - Rules to tweak published metadata
 - Support for Java 13
 - Faster incremental Java and Groovy compilation
 - New Zinc compiler for Scala
 - VS2019 support
 - Support for Gradle Enterprise plugin 3.0

For more details see https://docs.gradle.org/6.0.1/release-notes.html


------------------------------------------------------------
Gradle 6.0.1
------------------------------------------------------------

Build time:   2019-11-18 20:25:01 UTC
Revision:     fad121066a68c4701acd362daf4287a7c309a0f5

Kotlin:       1.3.50
Groovy:       2.5.8
Ant:          Apache Ant(TM) version 1.10.7 compiled on September 1 2019
JVM:          1.8.0_242 (Private Build 25.242-b08)
OS:           Linux 5.3.0-42-generic amd64

+ npm -v
6.13.7
+ node -v
v13.9.0
+ cat /etc/lsb-release /etc/os-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS"
NAME="Ubuntu"
VERSION="18.04.2 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.2 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```

