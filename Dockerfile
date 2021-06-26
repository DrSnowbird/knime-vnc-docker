FROM openkbs/jdk-mvn-py3-vnc

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

## ---- USER_NAME is defined in parent image: openkbs/jdk-mvn-py3-x11 already ----
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}

##########################################
#### ---- Build ARG and RUN ENV ---- #####
##########################################
ARG PRODUCT=${PRODUCT:-knime}
ENV PRODUCT=${PRODUCT}

ENV PRODUCT_WORKSPACE=${PRODUCT_WORKSPACE:-"${HOME}/${PRODUCT}-workspace"}

ENV WORKSPACE=${WORKSPACE:-"${HOME}/workspace"}

ENV DATA=${DATA:-"${HOME}/data"}

ARG PRODUCT_VERSION=${PRODUCT_VERSION:-4.3.3}
ENV PRODUCT_VERSION=${PRODUCT_VERSION}

ARG PRODUCT_DIR=${PRODUCT_DIR:-knime_${PRODUCT_VERSION}}
ENV PRODUCT_DIR=${PRODUCT_DIR}

ARG INSTALL_BASE=${INSTALL_BASE:-/opt}
ENV INSTALL_BASE=${INSTALL_BASE}

ENV PRODUCT_EXE=${PRODUCT_EXE:-${INSTALL_BASE}/${PRODUCT_DIR}/${PRODUCT}}

ARG PRODUCT_URL=${PRODUCT_URL:-https://download.knime.org}

# ENV DOWNLOAD_URL=https://download.knime.org/analytics-platform/linux/knime_4.2.2.linux.gtk.x86_64.tar.gz
#ARG DOWNLOAD_URL=https://download.knime.org/analytics-platform/linux/${PRODUCT}_${PRODUCT_VERSION}.linux.gtk.x86_64.tar.gz
ARG DOWNLOAD_URL=${PRODUCT_URL}/analytics-platform/linux/${PRODUCT}_${PRODUCT_VERSION}.linux.gtk.x86_64.tar.gz

####################################
#### ---- Install product: ---- ####
####################################
WORKDIR ${INSTALL_BASE}

#### ---- Install for application ----
RUN sudo wget -q -c ${DOWNLOAD_URL} && \
    sudo tar xvf $(basename ${DOWNLOAD_URL}) && \
    sudo rm -f $(basename ${DOWNLOAD_URL} )
    
RUN sudo mkdir -p ${DATA} ${WORKSPACE} ${PRODUCT_WORKSPACE} && \
    sudo chown -R ${USER}:${USER} ${DATA} ${WORKSPACE} ${PRODUCT_WORKSPACE}
    
#########################################
#### ---- Addition Libs/Plugins ---- ####
#########################################
## -- hub.docker build having issue; temporarily remove these two lines --
#RUN sudo apt-get update -y && \
#    sudo apt-get install -y libwebkitgtk-3.0-0

##################################
#### VNC ####
##################################
WORKDIR ${HOME}

USER ${USER}

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]

CMD ["--wait"]

########################
#### ---- KNIME ----####
########################
VOLUME ${PRODUCT_WORKSPACE}
VOLUME ${WORKSPACE}
VOLUME ${DATA}

WORKDIR ${HOME}
USER ${USER}

#CMD ["/bin/sh" "-c" "\"${{PRODUCT_EXE}\""]
CMD "${PRODUCT_EXE}"

#### --- For debug only ---- ####
#CMD ["/usr/bin/firefox"]

