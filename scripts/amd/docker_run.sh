set -o xtrace

alias drun='sudo docker run -it --rm --network=host --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined'

# DEVICES="--gpus all"
DEVICES="--device=/dev/kfd --device=/dev/dri"

MEMORY="--ipc=host --shm-size 16G"

VOLUMES="-v $HOME/dockerx:/dockerx -v /data:/data -v /tmp/packages:/tf/pkg -v /home/master/dockerx/tensorflow-upstream:/tf/tensorflow -v /tmp/bazelcache:/tf/cache"

# WORK_DIR="/root/$(basename $(pwd))"
WORK_DIR="/dockerx/$(basename $(pwd))"

IMAGE_NAME=my-tf-devel
CONTAINER_NAME=sig_build

ls /tmp
# rm -rf /tmp/tensorflow
git clone -b sigbuild_changes https://github.com/ROCmSoftwarePlatform/tensorflow-upstream ~/dockerx/tensorflow-upstream

# start new container
CONTAINER_ID=$(drun -d -w $WORK_DIR --name $CONTAINER_NAME $MEMORY $VOLUMES $DEVICES $IMAGE_NAME)
# docker cp . $CONTAINER_ID:$WORK_DIR
# docker exec $CONTAINER_ID bash -c "bash scripts/amd/run.sh"
docker attach $CONTAINER_ID
docker stop $CONTAINER_ID
docker rm $CONTAINER_ID
