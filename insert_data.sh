#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER == "winner" ]]
  then
    continue
  fi

  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  if [[ -z $WINNER_TEAM_ID ]]
  then
    INSERT_RESULT_TEAM=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
    if [[ $INSERT_RESULT_TEAM == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $WINNER
      WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi

  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  if [[ -z $OPPONENT_TEAM_ID ]]
  then
    INSERT_RESULT_TEAM=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
    if [[ $INSERT_RESULT_TEAM == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $OPPONENT
      OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi

INSERT_RESULT_GAME=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR,'$ROUND',$WINNER_TEAM_ID,$OPPONENT_TEAM_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
 if [[ $INSERT_RESULT_GAME == "INSERT 0 1" ]]
    then
      echo Inserted into games, $WINNER $OPPONENT
    fi

done