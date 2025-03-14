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

#---------------
# main functions
#---------------

# get user choice of "rock", "paper", or "scissors"
get_user_choice() {

}

# get random choice of "rock", "paper", or "scissors" from computer
get_random_choice() {
    local rps_array=("rock" "paper" "scissors")
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