cd $(dirname $0)

SWIFT_GEN_DIR='../SwiftGenerated'
CPP_GEN_DIR='../CppGenerated'

for DIR in $SWIFT_GEN_DIR $CPP_GEN_DIR
do
	if [ ! -d $DIR ];then
		mkdir -p $DIR
	fi
done


protoc --swift_out=$SWIFT_GEN_DIR --swift_opt=Visibility=Public *.proto
protoc --cpp_out=$CPP_GEN_DIR *.proto