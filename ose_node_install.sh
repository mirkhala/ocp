#!/bin/bash

HOSTNAME=$(hostname)
echo "$HOSTNAME: Registering..."
yum -y --disablerepo=rhui* install google-rhui-client-rhel7
yum -y install subscription-manager
subscription-manager register --username="YOUR-USERNAME" --password="YOUR-PASSWORD"

echo "$HOSTNAME: Attaching subscription and enabling repos..."
subscription-manager attach --pool=YOUR-POOL-ID
subscription-manager repos --disable="*" --enable="rhel-7-server-rpms" --enable="rhel-7-server-extras-rpms" --enable="rhel-7-server-ose-3.6-rpms" --enable="rhel-7-fast-datapath-rpms"

echo "$HOSTNAME: Updating..."
yum -y update

echo "$HOSTNAME: Installing dependencies..."
yum -y install wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct docker-1.12.6

echo "$HOSTNAME: Configuring Docker..."
sed -i '/OPTIONS=.*/c\OPTIONS="--selinux-enabled --insecure-registry 172.30.0.0/16"' /etc/sysconfig/docker

cat <<EOF > /etc/sysconfig/docker-storage-setup
DEVS=/dev/sdb
VG=docker_vg
EOF

docker-storage-setup

systemctl enable docker
systemctl start docker
