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
    echo "${string,,}"
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
        choice=$(lowercase $choice)
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

# get user choice for best out of X
choose_best_of() {
    local best_of_choice=""

    read -p "Best of...? (e.g. 3 for best 2 out of 3) " best_of_choice

    echo $best_of_choice
}

# calculate how many wins are needed (e.g., best of 5 requires 3 wins)
get_wins_needed() {
    local number=$1

    echo $(( ($number / 2) + 1 ))
}

# get the winner of the match from the user and computer moves
decide_winner() {
    local user_move=$1
    local computer_move=$2

    if [[ $user_move == $computer_move ]]
    then
        echo "tie"
    elif [[ $user_move == "r" && $computer_move == "s" ]] || \
         [[ $user_move == "p" && $computer_move == "r" ]] || \
         [[ $user_move == "s" && $computer_move == "p" ]] 
    then
        echo "user"
    else
        echo "computer"
    fi
}

# run rock, paper, scissors game
play_game() {
  # Prompt for best of X
  best_of=$(choose_best_of)
  
  # Calculate needed wins
  wins_needed=$( get_wins_needed $best_of )

  player_score=0
  computer_score=0

  # Loop until someone reaches the required number of wins
  while [[ $player_score -lt $wins_needed && $computer_score -lt $wins_needed ]]; do
    
    # 1. Get user move
    user_move=$(get_user_choice)   # e.g., "rock", "paper", "scissors"
    
    # 2. Get computer move
    computer_move=$(get_random_choice)
    
    echo "You chose: $user_move"
    echo "Computer chose: $computer_move"

    # 3. Compare moves and update scores
    winner=$(decide_winner "$user_move" "$computer_move") 

    case $winner in
      "user")
        ((player_score++))
        echo "You win this round!"
        ;;
      "computer")
        ((computer_score++))
        echo "Computer wins this round!"
        ;;
      "tie")
        echo "It's a tie!"
        ;;
    esac

    echo "Score -> You: $player_score | Computer: $computer_score"
    echo "---------------------------------"
  done

  # Announce the final result
  if [[ $player_score -ge $wins_needed ]]; then
    echo "Congratulations! You won the match."
  else
    echo "The computer won the match. Better luck next time!"
  fi
}

main() {
    echo "Welcome to ROCK_PAPER_SCISSORS!"
    echo "by Austin Russell and Benjamin Wilkins"
    echo "--------------------------------------"

    local continue="y"

    while [[ $continue == "y" ]]
    do
      echo ""
      
      play_game

      read -p "Would you like to play again? (y, n) " continue
      continue=$(lowercase $continue)
      continue=${continue:0:1}
    done
}

# Call the main function if this script is run directly
# (and not sourced by another script)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main
fi















# Final Output FOR GAME

#"welcome to our Rock_paper_siccors Game!"

#"Best of ...?"

#"Make your move: (r)ock, (p)aper, or (s)iccors"

# "R>S"

#"S>P"

#"P>S"

# " Computer Chose: " 

#"You Won! Congradulations"

#"Better luck next time!"

#"Would you like to play again?"

# "Computer's score ="

# "Players score ="