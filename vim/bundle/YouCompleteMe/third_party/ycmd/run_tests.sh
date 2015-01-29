#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function usage {
  echo "Usage: $0 [--no-clang-completer] [--skip-build]"
  exit 0
}

echo "Running flake8"
flake8 --select=F,C9 --max-complexity=10 --exclude=testdata "${SCRIPT_DIR}/ycmd"

use_clang_completer=true
skip_build=false
for flag in $@; do
  case "$flag" in
    --no-clang-completer)
      use_clang_completer=false
      ;;
    --skip-build)
      skip_build=true
      ;;
    *)
      usage
      ;;
  esac
done

if [ -n "$USE_CLANG_COMPLETER" ]; then
  use_clang_completer=$USE_CLANG_COMPLETER
fi

if $use_clang_completer; then
  extra_cmake_args="-DUSE_CLANG_COMPLETER=ON -DUSE_DEV_FLAGS=ON"
else
  extra_cmake_args="-DUSE_DEV_FLAGS=ON"
fi

if ! $skip_build; then
  EXTRA_CMAKE_ARGS=$extra_cmake_args YCM_TESTRUN=1 \
    "${SCRIPT_DIR}/build.py" --omnisharp-completer
fi

for directory in "${SCRIPT_DIR}"/third_party/*; do
  if [ -d "${directory}" ]; then
    export PYTHONPATH=${directory}:$PYTHONPATH
  fi
done

if $use_clang_completer; then
  nosetests -v "${SCRIPT_DIR}/ycmd"
else
  nosetests -v --exclude=".*Clang.*" "${SCRIPT_DIR}/ycmd"
fi
