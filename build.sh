#!/usr/bin/env bash

curl -sL https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-19.1.3.zip -o llvm-project.zip
unzip -q llvm-project.zip 

cd llvm-project-llvmorg-19.1.3/

mkdir buid
mkdir install
cd buid

brew install ninja
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS='lld' -DCMAKE_INSTALL_PREFIX=./install  -DLLVM_ROOT$(brew --prefix llvm@18) ../llvm

ninja lld
ninja install
