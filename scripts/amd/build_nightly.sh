set -e

cd /tf/tensorflow

# update version
python3 tensorflow/tools/ci_build/update_version.py --nightly

cp -rf /dockerx/tensorflow-build/tf_sig_build_dockerfiles/devel.usertools/. /usertools

# build tensorflow gpu
bazel --bazelrc=/usertools/rocm.bazelrc \
    build --config=sigbuild_local_cache \
    tensorflow/tools/pip_package:build_pip_package

# # construct tensorflow pip package
# ./bazel-bin/tensorflow/tools/pip_package/build_pip_package \
#     /tf/pkg \
#     --nightly_flag

# # check wheels are manylinux !Important
# /usertools/rename_and_verify_wheels.sh

# # check package
# ls -al /tmp/packages

# # run pip tests
# /usertools/setup_venv_test.sh bazel_pip "/tf/pkg/tf_nightly*.whl"
# bazel --bazelrc=/usertools/gpu.bazelrc \
#     test --config=sigbuild_local_cache \
#     --config=pip
