
#!/bin/bash

file="blackbox*"
for var in $file
do
    ./bbd.sh $var check.asm
    echo -ne "\n"
done

