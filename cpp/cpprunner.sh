#!/bin/bash
#codeblocks oldschool: compile, run, show output and time in console

path=$1"/"
file=$2
rundir=$3"/"

compiler="g++"
standard=20
warnings=("uninitialized" "init-self" "return-type" "reorder" "parentheses")

werrors=""
for warning in ${warnings[*]}; do werrors="${werrors} -Werror=${warning}"; done

compiler_args="-O2 -std=c++$standard $werrors -DBIZON"

cd $rundir

if ! $(test -f $file.cpp) || ! $(cmp -s $path$file.cpp $file.cpp)
then
    echo compiling... $path$file.cpp
    
    if ! $compiler $path$file.cpp -o$file $compiler_args
    then 
        echo compilation failed
        rm $file.cpp
        exit 0
    fi
    
    echo $file compiled successful
    cp $path$file.cpp $file.cpp
fi

echo run $file in $rundir

cd $path
ulimit -s  524288   #512Mb stack
ulimit -Sv 10000000  #~10Gb memory

#unset GTK_PATH

#xterm -bg "#333333" -fg "#f2f2f2" -geometry 80x25+800+400 -e \
#gnome-terminal --title="$file.cpp" --geometry 80x25+800+400 -- \
konsole -e \
    bash -c '/usr/bin/time --format="\nused time:\t%U seconds\nused mem:\t%M Kb\n%x"  "'$rundir$file'" ; read'

#Hello world!
#used time:      1.23 seconds
#used mem:       4567 Kb
#0

