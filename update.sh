#!/bin/sh

# shellcheck disable=SC2164
ROOT=$(cd "$(dirname "$0")";pwd)

# commons
cd "$ROOT/packages/commons"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# api
cd "$ROOT/packages/server"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
rm -rf dist
rm -rf build
ncu -u
# mobile
cd "$ROOT/packages/www/commons"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# webapp
cd "$ROOT/packages/www/webapp"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# root
cd "$ROOT"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
#
ncu -u
#
pnpm install
