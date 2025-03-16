#!/usr/bin/env bash

# Source your functions (if they are in separate files)
# . ./choose_best_of.sh
# . ./your_other_functions.sh

main() {
  # Prompt for best of X (odd number)
  best_of=$(choose_best_of)
  
  # Calculate how many wins are needed (e.g., best of 5 requires 3 wins)
  wins_needed=$(( (best_of + 1) / 2 ))

  player_score=0
  computer_score=0

  # Loop until someone reaches the required number of wins
  while [[ $player_score -lt $wins_needed && $computer_score -lt $wins_needed ]]; do
    
    # 1. Get user move
    user_move=$(get_user_choice)   # e.g., "rock", "paper", "scissors"
    
    # 2. Get computer move
    computer_move=$(get_computer_choice)
    
    echo "You chose: $user_move"
    echo "Computer chose: $computer_move"

    # 3. Compare moves and update scores
    winner=$(decide_winner "$user_move" "$computer_move") 
    # ^ you'd implement decide_winner to return "user", "computer", or "tie"

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

# Call the main function if this script is run directly
# (and not sourced by another script)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main
fi