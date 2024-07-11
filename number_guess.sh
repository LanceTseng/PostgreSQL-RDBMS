#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
echo "Enter your username:"
read USERNAME

while [[ -z $USERNAME  ]]
do
  echo "Enter your username:"
  read USERNAME
done

function getGamePlayed()
{
   $PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = $1"
}

function getBestGuess(){
  $PSQL "select min(number_of_guess) from games where user_id = $1"
}

function addGuessRecord(){
     $PSQL "insert into games (user_id, number_of_guess) values ($1, $2)"
}

USER_INFO=$($PSQL "select * from users where username = '$USERNAME'");
if [[ -z $USER_INFO ]]
then
  INSERT_USER_RESULT=$($PSQL "insert into users (username) values ('$USERNAME')");
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  
  else
  echo "$USER_INFO" | while read USER_ID BAR USERNAME
  do
    PLAYED_GAME=$(getGamePlayed "$USER_ID" | tr -d '[:space:]')
    BEST_GAME=$(getBestGuess "$USER_ID" | tr -d '[:space:]')
    if [[ $PLAYED_GAME == 0 ]]
    then
      echo "Welcome, $USERNAME! It looks like this is your first time here."
    else
     echo "Welcome back, $USERNAME! You have played $PLAYED_GAME games, and your best game took $BEST_GAME guesses."
    fi

  done
fi

    NUMBER_OF_GUESS=0
    RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

      echo "Guess the secret number between 1 and 1000:"
      read GUESS_NUMBER
       NUMBER_OF_GUESS=$((NUMBER_OF_GUESS + 1))

      while [[ $RANDOM_NUMBER != $GUESS_NUMBER ]]
      do
        if ! [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]
        then
          echo "That is not an integer, guess again:"
          read GUESS_NUMBER
          continue
         fi

        if [[ $RANDOM_NUMBER -gt $GUESS_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
        else
          echo "It's lower than that, guess again:"
        fi
       
        read GUESS_NUMBER
        NUMBER_OF_GUESS=$((NUMBER_OF_GUESS + 1))
      done
      
      
      USER_ID=$($PSQL "select user_id from users where username = '$USERNAME'");
      INSERT_GAME_RESULT=$(addGuessRecord $USER_ID $NUMBER_OF_GUESS)
      echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"

