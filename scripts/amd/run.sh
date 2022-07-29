clear

# set -x
# set -e

ROOT_DIR=$(pwd)
LOG_DIR=$ROOT_DIR/log_$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
LOG_DIR="${1:-$LOG_DIR}"
rm -rf $LOG_DIR
mkdir -p $LOG_DIR
chmod -R 777 $LOG_DIR

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# cd "/root/.bazel/bin" && curl -fLO https://releases.bazel.build/5.1.1/release/bazel-5.1.1-linux-x86_64 && chmod +x bazel-5.1.1-linux-x86_64
# cd "/root/.bazel/bin" && curl -fLO https://releases.bazel.build/5.0.0/release/bazel-5.0.0-linux-x86_64 && chmod +x bazel-5.0.0-linux-x86_64

# rm -rf /tmp/pkg/

cd $ROOT_DIR
bash scripts/amd/build_nightly.sh $LOG_DIR 2>&1 | tee $LOG_DIR/build_nightly.log
