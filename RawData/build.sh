#!/bin/zsh
#使用zsh是因为bash默认不支持**通配符


cd $(dirname $0)

SWIFT_GEN_DIR=../swift_gen
CPP_GEN_DIR=../cpp_gen

if [ -d $SWIFT_GEN_DIR ];then
	rm -r $SWIFT_GEN_DIR
fi

if [ -d $CPP_GEN_DIR ];then 
	rm -r $CPP_GEN_DIR
fi

mkdir -p $SWIFT_GEN_DIR
mkdir -p $CPP_GEN_DIR

protoc --swift_out=$SWIFT_GEN_DIR --swift_opt=Visibility=Public **/*.proto
protoc --cpp_out=$CPP_GEN_DIR **/*.proto