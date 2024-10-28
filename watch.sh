#!/usr/bin/sh
set -e

# Store the last modification times of the .tl files
last_mod_time=""

# Function to get the modification times of all .tl files
get_mod_times() {
    find . -name "*.tl" -exec stat -c %Y {} \; | sort | tr "\n" " "
}

while true; do
    # Get the current modification times
    current_mod_time=$(get_mod_times)

    # Check if the modification times have changed
    if [ "$current_mod_time" != "$last_mod_time" ]; then
        sh ./build.sh && echo SUCCESS || echo ERROR

        # Update the last modification times
        last_mod_time=$current_mod_time
    fi


    sleep 1
done