ls /tmp
# rm -rf /tmp/tensorflow
git clone https://github.com/ROCmSoftwarePlatform/tensorflow-upstream /tmp/tensorflow

docker rm tf
docker run --name tf -w /tf/tensorflow -it -d \
  -v "/tmp/packages:/tf/pkg" \
  -v "/tmp/tensorflow:/tf/tensorflow" \
  -v "/tmp/bazelcache:/tf/cache" \
  -v "/docker/tensorflow-build:/tf/build" \
  tensorflow/build:latest-python3.9 \
  bash

# # update version
# docker exec tf \
#   python3 tensorflow/tools/ci_build/update_version.py --nightly

# # build tensorflow gpu
# docker exec tf \
#   bazel --bazelrc=/usertools/gpu.bazelrc \
#   build --config=sigbuild_local_cache \
#   tensorflow/tools/pip_package:build_pip_package

# # construct tensorflow pip package
# docker exec tf \
#   ./bazel-bin/tensorflow/tools/pip_package/build_pip_package \
#   /tf/pkg \
#   --nightly_flag

# # check wheels are manylinux !Important
# docker exec tf \
#   /usertools/rename_and_verify_wheels.sh

# # check package
# docker exec tf \
#   ls -al /tmp/packages

# # run pip tests
# docker exec tf \
#   /usertools/setup_venv_test.sh bazel_pip "/tf/pkg/tf_nightly*.whl" \
#   bazel --bazelrc=/usertools/gpu.bazelrc \
#   test --config=sigbuild_local_cache \
#   --config=pip
