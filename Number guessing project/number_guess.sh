#!/bin/bash

# Script for the number guessing project

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

RANDOM_NUMBER=$(($RANDOM%(1001)))

COUNT_GAMES=1

GAME() {
  echo "Guess the secret number between 1 and 1000:"
  read INPUT_NUMBER
  
  if [[ ! $INPUT_NUMBER =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
      GAME
  else
    if [[ $INPUT_NUMBER > $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        let COUNT_GAMES++
        GAME
    elif [[ $INPUT_NUMBER < $RANDOM_NUMBER ]]
      then 
        echo "It's higher than that, guess again:"
        let COUNT_GAMES++
        GAME
    else
      echo -e "\nYou guessed it in $COUNT_GAMES tries. The secret number was $INPUT_NUMBER. Nice job!"
      # Inserting data into database
      NAME_ID=$($PSQL "SELECT name_id FROM names WHERE name='$NAME'")
      INSERT_RESULT=$($PSQL "INSERT INTO games(name_id, n_guesses) VALUES($NAME_ID, $COUNT_GAMES)")
    fi

  fi

}

INTRO() {
    echo -e "\nEnter your username:"
    read NAME
    NAME_RESULT=$($PSQL "SELECT * FROM names WHERE name='$NAME'")
    
    if [[ -z $NAME_RESULT ]]
      then
        echo "Welcome, $NAME! It looks like this is your first time here."
        # Insert name into db
        INSERT_NAME_FIRST_TIME_RESULT=$($PSQL "INSERT INTO names VALUES('$NAME')")
        # Call game
        GAME

      else
        #print summary
        GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games LEFT JOIN names USING(name_id) WHERE name='$NAME'")
        BEST_GAME=$($PSQL "SELECT n_guesses FROM games LEFT JOIN names USING(name_id) WHERE name='$NAME' ORDER BY n_guesses LIMIT 1")
        echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."  | sed -r 's/\s{2,}/ /g'
        # Call game
        GAME
    fi
}

INTRO
