#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
  
    WINNER_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
    if [[ -z $WINNER_ID ]]
    then 
      RES_INS_WIN=$($PSQL "insert into teams (name) values ('$WINNER')")
      if [[ $RES_INS_WIN == "INSERT 0 1" ]]
      then
        echo Inserted team $WINNER
      fi
      WINNER_ID=$($PSQL "select team_id 
                         from teams 
                         where name = '$WINNER'")
    fi
    OPPONENT_ID=$($PSQL "select team_id 
                         from teams 
                         where name = '$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then 
      RES_INS_OPP=$($PSQL "insert into teams (name) 
                                       values ('$OPPONENT')")
      if [[ $RES_INS_OPP == "INSERT 0 1" ]]
      then
        echo Inserted team $OPPONENT
      fi
      OPPONENT_ID=$($PSQL "select team_id 
                           from teams 
                           where name = '$OPPONENT'")
    fi
    RES_INS_GAME=$($PSQL "insert into 
                          games (year, round, winner_id, opponent_id, 
                                 winner_goals, opponent_goals)
                          values ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, 
                                  $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $RES_INS_GAME == "INSERT 0 1" ]]
    then 
      echo Inserted game $YEAR $ROUND $WINNER : $OPPONENT
    fi
  fi
done