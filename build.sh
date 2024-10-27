#!/usr/bin/sh
set -e

tl gen *.tl 
tl gen functions/*.tl
tl gen helpers/*.tl
