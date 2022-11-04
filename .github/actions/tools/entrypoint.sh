#!/bin/bash

set -eu

#datasource=github-tags depName=mikefarah/yq
YQ_VERSION="v4.6.1"

mkdir -p "${GITHUB_WORKSPACE}/bin"
cd "${GITHUB_WORKSPACE}/bin"

curl -sL "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" -o yq
chmod +x "${GITHUB_WORKSPACE}/bin/yq"

echo "${GITHUB_WORKSPACE}/bin" >> "${GITHUB_PATH}"
echo "$RUNNER_WORKSPACE/$(basename "${GITHUB_REPOSITORY}")/bin" >> "${GITHUB_PATH}"
