docker run --name tf -w /tf/tensorflow -it -d \
  -v "/tmp/packages:/tf/pkg" \
  -v "/tmp/tensorflow:/tf/tensorflow" \
  -v "/tmp/bazelcache:/tf/cache" \
  tensorflow/build:latest-python3.9 \
  bash