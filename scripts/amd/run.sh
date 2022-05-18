clear

set -x
set -e

ROOT_DIR=$(pwd)
LOG_DIR=$ROOT_DIR/log_$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
LOG_DIR="${1:-$LOG_DIR}"
rm -rf $LOG_DIR
mkdir -p $LOG_DIR
chmod -R 777 $LOG_DIR

bash scripts/amd/build_nightly.sh $LOG_DIR 2>&1 | tee $LOG_DIR/build_nightly.log
