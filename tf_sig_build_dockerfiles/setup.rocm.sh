#!/usr/bin/env bash
#
# Install ROCm libs
ROCM_VERS=$1
ROCM_PATH=/opt/rocm
ROCM_REPO_URL=http://repo.radeon.com/rocm/apt/$ROCM_VERS/
BUILD_JOB_ID=ubuntu
LKG_BUILD_NUM=main
echo deb [arch=amd64 trusted=yes] $ROCM_REPO_URL $BUILD_JOB_ID $LKG_BUILD_NUM > /etc/apt/sources.list.d/rocm.list
apt-get update
apt-get install -y kmod
DEBIAN_FRONTEND=noninteractive apt-get install -y rocm-dev rocm-libs
apt-get clean
rm -rf /var/lib/apt/lists/*
echo -e "gfx900\ngfx906\ngfx908\ngfx90a\ngfx1030" >> $ROCM_PATH/bin/target.lst
