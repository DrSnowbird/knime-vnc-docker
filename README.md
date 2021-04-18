# KNIME (latest/4.3.2) + Java 8 OpenJDK + Maven 3.6 + Python 3.6 + PIP3 20 + + npm 7 + node 15 + Gradle 6 + noVNC
KNIME Analytics Platform with VNC/noVNC for Container Cluster Platforms (Openshift, Kubernetes, etc.)
[![](https://images.microbadger.com/badges/image/openkbs/knime-vnc-docker.svg)](https://microbadger.com/images/openkbs/knime-vnc-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/knime-vnc-docker.svg)](https://microbadger.com/images/openkbs/knime-vnc-docker "Get your own version badge on microbadger.com")

# Just a suggestion: If you need Python Jupyter (loaded with Tensorflow) Docker besides KNIME, you may want to check out:
* [Python Jupyter (by openkbs/tensorflow-python3-jupyter)](https://hub.docker.com/repository/docker/openkbs/tensorflow-python3-jupyter)

## Join, Share, and Support the KNIME Community: 
* [KNIME Blogs](https://www.knime.com/blog)
* [Join the Community at KNIME web site](https://www.knime.com/knime-community)

# Components:
* VNC/NoVNC-based Docker [KNIME Platform](https://www.knime.com/) for Use with HTML 5 Browsers from anywhere.
* [KNIME Platform](https://www.knime.com/download-knime-analytics-platform-sdk) latest (v 4.3.2) for Machine Learning & Big Data Analytics
* Ubuntu 18.04 LTS now.
* [Java openkbs/jdk-mvn-py3 - see README.md](https://github.com/DrSnowbird/jdk-mvn-py3/blob/master/README.md)
* [Base Container Image: openkbs/jdk-mvn-py3](https://github.com/DrSnowbird/jdk-mvn-py3)
* [Base Container Image: openkbs/jdk-mvn-py3-vnc](https://github.com/DrSnowbird/jdk-mvn-py3-vnc)
* [Base Components: OpenJDK, Python 3, PIP, Node/NPM, Gradle, Maven, etc.](https://github.com/DrSnowbird/jdk-mvn-py3#components)

# Run (recommended for easy-start)
Image is pulled from openkbs/knime-vnc-docker
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

### 1.) Modify ./run.sh file
```
#VNC_RESOLUTION="1280x1024"
VNC_RESOLUTION="1920x1280"
```

### 2.) Customize Openshift or Kubernetes container run envionrment
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
* You might see WARNING message in the log from Eclipse for class not found. It has no impact in VNC or the KNIME tools. However, it might needs to be fixed by KNIME product team. We will not address here it for now.
```
WARNING: Aries Blueprint packages not available. So namespaces will not be registered
java.lang.NoClassDefFoundError: org/apache/aries/blueprint/NamespaceHandler
```

# Releases information
See [Release information](https://github.com/DrSnowbird/jdk-mvn-py3#releases-information)

