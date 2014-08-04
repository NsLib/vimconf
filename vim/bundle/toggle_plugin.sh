#!/bin/bash

if [ $# -ne 1 ]; then
    cat <<EOF
Usage: $0 <script_name>
EOF
fi

script_name="$1"

if [ -e "${script_name}.tar.gz" ]; then
    tar vxzf "${script_name}.tar.gz" && rm -rf "${script_name}.tar.gz"
elif [ -e "${script_name}" ]; then
    tar vzcf "${script_name}.tar.gz" "${script_name}" && rm -rf "${script_name}"
fi
