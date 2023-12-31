#!/bin/bash

#Script for querying periodic_table database 
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
  then 
    echo "Please provide an element as an argument."
  elif [[ $1 =~ ^[0-9]+$ ]]
      then
        RESULTS_BY_ATOMIC_NUMBER=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
        if [[  $RESULTS_BY_ATOMIC_NUMBER ]]
          then 
            NAME=$($PSQL "SELECT name FROM elements INNER JOIN properties USING(atomic_number) WHERE atomic_number=$1")
            SYMBOL=$($PSQL "SELECT symbol FROM elements INNER JOIN properties USING(atomic_number) WHERE atomic_number=$1")
            TYPE=$($PSQL "SELECT type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
            ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$1")
            MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$1")
            BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$1")
            echo "The element with atomic number $1 is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius." | sed -r 's/\s{2,100}/ /g' | sed -r 's/\(\s/(/g'
         
        fi
    

    elif [[ $1 =~ ^[A-Z][a-z]{3,}$ ]]
      then
        RESULTS_BY_NAME=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")
        if [[  $RESULTS_BY_NAME ]]
          then 
            ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
            SYMBOL=$($PSQL "SELECT symbol FROM elements INNER JOIN properties USING(atomic_number) WHERE name='$1'")
            TYPE=$($PSQL "SELECT type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")
            ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties INNER JOIN elements USING(atomic_number) WHERE name='$1'")
            MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE name='$1'")
            BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE name='$1'")
            echo "The element with atomic number $ATOMIC_NUMBER is $1 ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $1 has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius." | sed -r 's/\s{2,100}/ /g' | sed -r 's/\(\s/(/g'
         
        fi
    elif [[ $1 =~ ^[A-Z][a-z]{0,1}$ ]]
      then
        RESULTS_BY_SYMBOL=$($PSQL "SELECT * FROM elements WHERE symbol='$1'")
        if [[  $RESULTS_BY_SYMBOL ]]
          then 
            NAME=$($PSQL "SELECT name FROM elements WHERE symbol='$1'")
            ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
            TYPE=$($PSQL "SELECT type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'")
            ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol='$1'")
            MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol='$1'")
            BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol='$1'")
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($1). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius." | sed -r 's/\s{2,100}/ /g' | sed -r 's/\(\s/(/g'
          
          fi
    else
      echo "I could not find that element in the database." 
    

fi
