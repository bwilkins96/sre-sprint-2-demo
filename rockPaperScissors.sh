#!/bin/bash

# command-line rock, paper, scissors game written in bash

#-----------------
# helper functions
#-----------------

random_number() {
    local min=$1
    local max=$2

    local res=$((RANDOM % (max - min + 1) + min))
    echo $res
}

lowercase() {
    local string=$1
    echo "${choice,,}"
}

#---------------
# main functions
#---------------

# get user choice of "r", "p", or "s"
get_user_choice() {
    local choice=""

    while [[ $choice != ["r""p""s"] ]]
    do
        read -p "Enter rock (r), paper (p), or scissors (s): " choice
        choice=$(lowercase choice)
        choice=${choice:0:1}
    done

    echo $choice
}

# get random choice of "r", "p", or "s" from computer
get_random_choice() {
    local rps_array=("r" "p" "s")
    local random_index=$( random_number 0 2 )

    echo ${rps_array[$random_index]}
}


# run 1 round of rock, paper, scissors
play_round() {

}

# run rock, paper, scissors game
play_game() {

}

play_game