#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#Script to insert data into worldcup database

echo $($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Inserting data into teams table
  if [[ $OPPONENT != 'opponent' ]]
    then
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
      if [[ -z $TEAM_ID ]]
        then
          INSERTED_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
          if [[ $INSERTED_TEAM_NAME == 'INSERT 0 1' ]]
            then 
              echo "Inserted $OPPONENT into database"
          fi
          TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
      fi
  
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
        if [[ -z $TEAM_ID ]]
          then
            INSERTED_TEAM_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
            if [[ INSERTED_TEAM_NAME == 'INSERT 0 1' ]]
              then
                echo "Inserted $WINNER into database"
            fi
            TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
        fi
  fi
done

# Inserting data into games table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
    then
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      INSERTED_DATA=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR,'$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
      if [[ $INSERTED_DATA == 'Insert 0 1' ]]
        then
          echo "Inserted $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID $WINNER_GOALS, $OPPONENT_GOALS into database"
      fi
  fi
done