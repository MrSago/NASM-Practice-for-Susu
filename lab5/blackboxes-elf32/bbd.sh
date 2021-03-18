
#!bin/bash
#Blackbox destroyer v0.1

args=2
if [ $# -ne "$args" ]
then
    echo "Syntax: $0 [object file] [template asm file]"
    exit -1
fi

obj_name="${1%.*}"
if test -f $obj_name.o
then
    echo "Object file: $obj_name.o"
else
    echo "File not found: $obj_name.o"
    exit -2
fi

function="$(rabin2 -s $obj_name.o | grep GLOBAL | awk '{print ($7)}')"
if [ $? -ne 0 ]
then
    echo "Can't get function name"
    exit -3
else
    echo "Function name: $function"
fi

asm_name=$2
tmp_file="tmp"
cp $asm_name $tmp_file.asm
if [ $? -ne 0 ]
then
    echo "Can't copy $asm_name"
    exit -4
fi

sed_opt="s/FUNC_NAME/$function/g"
sed -i $sed_opt $tmp_file.asm
if [ $? -ne 0 ]
then
    echo "Can't prepare asm file: $tmp_file.asm"
    exit -5
fi

nasm -f elf32 -l $tmp_file.lst $tmp_file.asm
if [ $? -ne 0 ]
then
    echo -e "\nCan't compile $tmp_file.asm"
    exit -6
fi

gcc -m32 $tmp_file.o $obj_name.o -o $tmp_file.exe
if [ $? -ne 0 ]
then
    echo -e "\nCan't link object files"
    exit -7
fi

./$tmp_file.exe

rm $tmp_file*

