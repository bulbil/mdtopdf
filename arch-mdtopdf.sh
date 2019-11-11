#!/bin/bash

curr_dir=$(pwd)

if [ -z $1 ]; then
    cd ~/.bulbil/mdtopdf/ && make in_dir="$curr_dir" out_dir="$curr_dir"
else
    cd ~/.bulbil/mdtopdf/ && make prefix="$1" in_dir="$curr_dir" out_dir="$curr_dir"
fi    