#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#The variable generates a random number between 0 and 1000.
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

#Ask a user for their username.
ASK_FOR_USERNAME(){
  echo -e "\nEnter your username:"
  read USERNAME

  #Count the number of characters for the username provided to ensure that it is not greater than 22 characters.
  USERNAME_CHARACTERS=$(echo $USERNAME | wc -c)
  if [[ $USERNAME_CHARACTERS -gt 22 ]]
  then
    #if the number of characters for the username provided is greater than 22, request for username re-entry.
    ASK_FOR_USERNAME
  fi
}

#Ask for username
ASK_FOR_USERNAME

#The variable queries the database to pull a username that already exists
RETURNING_USER=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

#The conditional statement carries out functions based on whether or not a user exists in the database.
if [[ -z $RETURNING_USER ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games INNER JOIN users USING(user_id) WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games INNER JOIN users USING(user_id) WHERE username = '$USERNAME'")
  GAMES=$(if [[ $GAMES_PLAYED -eq 1 ]]; then echo "game"; else echo "games"; fi)
  GUESSES=$(if [[ $BEST_GAME -eq 1 ]]; then echo "guess"; else echo "guesses"; fi)
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#Get the user id from the database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

TRIES=1
GUESS=0

NUMBER_GUESSING_GENERATOR(){
  read GUESS

  #As long as a user's guess is an integer and not equal to the secret number, the number of tries should be tallied up and the user's guess should be checked against the secret number to see whether or not it is greater than or less than it.
  while [[ $GUESS =~ ^[+-]?[0-9]+$ && ! $GUESS -eq $SECRET_NUMBER ]]
  do

    TRIES=$(expr $TRIES + 1)

    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then

      echo -e "\nIt's lower than that, guess again:"
      read GUESS

    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then

      echo -e "\nIt's higher than that, guess again:"
      read GUESS

    fi
  done

  #If a user's guess is not an integer an error message should be displayed
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
      echo -e "\nThat is not an integer, guess again:"
      TRIES=$(expr $TRIES + 1)
      NUMBER_GUESSING_GENERATOR
  fi

}

echo -e "\nGuess the secret number between 1 and 1000:"
NUMBER_GUESSING_GENERATOR

#Insert game data into database
INSERT_GAME=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USER_ID, $TRIES)")
PLURAL_TRIES=$(if [[ $TRIES -eq 1 ]]; then echo "try"; else echo "tries"; fi)
echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
