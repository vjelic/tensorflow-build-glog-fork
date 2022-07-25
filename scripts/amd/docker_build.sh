# print every command
set -o xtrace

# set path
cd dockerfiles
DOCKERFILE_PATH=tf_sig_build_dockerfiles/Dockerfile

# get tag
DOCKERFILE_NAME=$(basename $DOCKERFILE_PATH)
DOCKERIMAGE_NAME=$(echo "$DOCKERFILE_NAME" | cut -f 2- -d '.')
echo $DOCKERIMAGE_NAME

# build docker
cd tf_sig_build_dockerfiles
# DOCKER_BUILDKIT=1 docker build --build-arg ROCM_VERS=5.1 --build-arg PYTHON_VERSION=python3.8 --target=devel -t my-tf .
# DOCKER_BUILDKIT=1 docker build --build-arg ROCM_VERS=5.2 --build-arg PYTHON_VERSION=python3.8 --target=devel -t my-tf .
# DOCKER_BUILDKIT=1 docker build --build-arg PYTHON_VERSION=python3.9 --target=devel -t my-tf-devel .
# DOCKER_BUILDKIT=1 docker build --build-arg ROCM_VERS=5.2 PYTHON_VERSION=python3.9 --target=devel -t my-tf-devel .
DOCKER_BUILDKIT=1 docker build --no-cache --build-arg PYTHON_VERSION=python3.9 --build-arg ROCM_VERS=5.2 --target=devel -t my-tf-devel .
# DOCKER_BUILDKIT=1 docker build --build-arg PYTHON_VERSION=python3.9 --build-arg ROCM_VERS=5.2 --target=devel -t my-tf-devel .