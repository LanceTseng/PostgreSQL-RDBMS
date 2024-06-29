#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"


if [[ -z $1 ]]; then
  echo Please provide an element as an argument.
else

  if [[ $1 =~ ^[0-9]+$ ]]
  then
      # $1 is a number
    ATO_INFO=$($PSQL "SELECT atomic_number,symbol,name  FROM elements where atomic_number = $1")
  else
      # $1 is not a number
    ATO_INFO=$($PSQL "SELECT atomic_number,symbol,name  FROM elements where symbol = '$1' or name = '$1'")
  fi

  if [[ -z $ATO_INFO ]]
  then
    echo "I could not find that element in the database."
    exit
  fi

  echo "$ATO_INFO" | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME
  do
    PROPERTIES_INFO="$($PSQL "SELECT type_id,atomic_mass,melting_point_celsius,boiling_point_celsius FROM properties where atomic_number = $ATOMIC_NUMBER ")"
    echo "$PROPERTIES_INFO" | while IFS='|' read  TYPE_ID ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS 
    do

    TYPE="$($PSQL "SELECT type FROM types where type_id = $TYPE_ID ")";

    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius." 
    done
  done
  
fi


