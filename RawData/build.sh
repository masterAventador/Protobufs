cd $(dirname $0)

SWIFT_GEN_DIR='../swift_gen'
CPP_GEN_DIR='../cpp_gen'

for SUB_DIR in $(find . -type d | sed 's|^\./||'); do 
	GEN_DIR=$SWIFT_GEN_DIR/$SUB_DIR
	echo $GEN_DIR

	if [ ! -d $GEN_DIR ];then
		mkdir -p $GEN_DIR
	fi

 	protoc --swift_out=$SWIFT_GEN_DIR --swift_opt=Visibility=Public $SUB_DIR/*.proto
	protoc --cpp_out=$CPP_GEN_DIR $SUB_DIR/*.proto

done