set -x

cd tf_sig_build_dockerfiles

DOCKER_BUILDKIT=1 docker build --no-cache --build-arg PYTHON_VERSION=python3.9 --build-arg ROCM_VERS=5.2 --target=devel -t my-tf-devel .

docker run --name tf -w /tf/tensorflow -it -d -v "/tmp/packages:/tf/pkg" \
    -v "/home/master/dockerx/tensorflow-upstream:/tf/tensorflow" \
    -v "/tmp/bazelcache:/tf/cache" my-tf-devel:latest bash

docker exec tf bazel --bazelrc=/usertools/rocm.bazelrc build --config=sigbuild_local_cache tensorflow/tools/pip_package:build_pip_package

docker exec tf ./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tf/pkg --nightly_flag

docker exec tf /usertools/rename_and_verify_wheels.sh
