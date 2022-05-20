ls /tmp
# rm -rf /tmp/tensorflow
git clone https://github.com/ROCmSoftwarePlatform/tensorflow-upstream /tmp/tensorflow

docker stop tf
docker rm tf
docker run --name tf -w /tf/tensorflow -it \
  -v "/tmp/packages:/tf/pkg" \
  -v "/tmp/tensorflow:/tf/tensorflow" \
  -v "/tmp/bazelcache:/tf/cache" \
  -v "$HOME/dockerx/tensorflow-build:/tf/build" \
  my-tf-devel \
  bash