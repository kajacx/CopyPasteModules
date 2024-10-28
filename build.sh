#!/usr/bin/sh
set -e

rm -f functions/*.lua helpers/*.lua

tl check *.tl && tl gen *.tl 
tl check functions/*tl && tl gen functions/*.tl
tl check helpers/*tl && tl gen helpers/*.tl
