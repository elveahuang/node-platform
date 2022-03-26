#!/bin/sh

# shellcheck disable=SC2164
ROOT=$(cd "$(dirname "$0")";pwd)
# ======================================================================================================================
# commons
# ======================================================================================================================
# @platform/commons
cd "$ROOT/packages/commons"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# ======================================================================================================================
# server
# ======================================================================================================================
# @platform/server
cd "$ROOT/packages/server"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
rm -rf dist
rm -rf build
ncu -u
# ======================================================================================================================
# www-commons
# ======================================================================================================================
# @platform/www-commons
cd "$ROOT/packages/www-commons"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# ======================================================================================================================
# react
# ======================================================================================================================
# @platform-react/commons
cd "$ROOT/packages/www-react/commons"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# @platform-react/commons
cd "$ROOT/packages/www-react/webapp"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# ======================================================================================================================
# vue
# ======================================================================================================================
# @platform-vue/commons
cd "$ROOT/packages/www-vue/commons"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# @platform-vue/mobile
cd "$ROOT/packages/www-vue/mobile"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# @platform-vue/mp
cd "$ROOT/packages/www-vue/mp"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# @platform-vue/webapp
cd "$ROOT/packages/www-vue/webapp"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
ncu -u
# ======================================================================================================================
# root
# ======================================================================================================================
cd "$ROOT"
pwd
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf node_modules
#
ncu -u
#
pnpm install
