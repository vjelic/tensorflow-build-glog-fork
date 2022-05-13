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
docker build -f $DOCKERFILE_PATH -t sig_build .