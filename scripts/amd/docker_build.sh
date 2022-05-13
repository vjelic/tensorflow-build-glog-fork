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
docker build -t sig_build .