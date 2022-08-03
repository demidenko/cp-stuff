#!/bin/bash
#codeblocks oldschool: compile, run, show output and time in console

path=$1"/"
file=$2
rundir=$3"/"


cd $rundir

if ! $(test -f $file.cpp) || ! $(cmp -s $path$file.cpp $file.cpp)
then
    echo compiling... $path$file.cpp
    
    if ! g++ $path$file.cpp -o$file -DBIZON -std=c++17 -O2 -fconcepts-ts -Wno-literal-suffix -Werror=uninitialized -Werror=init-self -Werror=return-type -Werror=reorder
    then 
        echo compilation failed
        exit 0
    fi
    
    echo $file compiled successful
    cp $path$file.cpp $file.cpp
fi

echo run $2 in $rundir

cd $path
ulimit -s  524288   #512Mb stack
ulimit -Sv 10000000  #~10Gb memory

xterm -bg "#333333" -fg "#f2f2f2" -geometry 80x25+800+400 -e bash -c '/usr/bin/time --format="\nused time:\t%U seconds\nused mem:\t%M Kb\n%x"  "'$rundir$file'" ; read'

#Hello world!
#used time:      1.23 seconds
#used mem:       4567 Kb
#0

