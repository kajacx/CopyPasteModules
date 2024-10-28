#!/usr/bin/sh
set -e

tl check *.tl && tl gen *.tl 
tl check functions/*tl && tl gen functions/*.tl
tl check helpers/*tl && tl gen helpers/*.tl
