#!/usr/bin/env bash
set -x

rm -Rf 5.16*

for ACTIVEMQ_VERSION in 5.16.0 5.16.1 5.16.2 5.16.3 5.16.4
do echo ''
ACTIVEMQ=apache-activemq-${ACTIVEMQ_VERSION}
SHA1VALUE=$(curl -Ls https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ-bin.tar.gz.sha512|awk '{print $1}')
cp -rp template ${ACTIVEMQ_VERSION}
sed -e "s/MYSHA/${SHA1VALUE}/g" ${ACTIVEMQ_VERSION}/Dockerfile
sed -e "s/MYVERSION/${ACTIVEMQ_VERSION}/g" ${ACTIVEMQ_VERSION}/Dockerfile
cp -rp template-alpine ${ACTIVEMQ_VERSION}-alpine
sed -e "s/MYSHA/${SHA1VALUE}/g" ${ACTIVEMQ_VERSION}-alpine/Dockerfile
sed -e "s/MYVERSION/${ACTIVEMQ_VERSION}/g" ${ACTIVEMQ_VERSION}-alpine/Dockerfile
done
