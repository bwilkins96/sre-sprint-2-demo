#!/bin/bash

# Extra file I'm putting stuff in for now to avoid merge conflicts!

best_of_number() {
    local number=$1

    echo $(( ($number / 2) + 1 ))
}

best_of_number 3       # -> 2
best_of_number 5       # -> 3
best_of_number 250     # -> 126