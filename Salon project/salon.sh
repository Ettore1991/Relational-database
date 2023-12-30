#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

ADD_NAME_NUMBER () {

  echo -e "\nI don't have a record for that phone number, what's your name?"

  # Ask for name and insert it into database along with phone number
  read CUSTOMER_NAME
  INSERT_NAME=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
}

SET_APPOINTMENT() {
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?" | sed -r 's/  / /g'
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME." | sed -r 's/  / /g'
}

MAIN_MENU() {
  
  if [[ $1 ]]
    then
      echo $1
  fi
  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  if [[ "$SERVICE_ID_SELECTED" =~ ^[0-9]+$ ]]
    then
      SERVICE_CHOSEN_RESULT=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    # if service not in list
    if [[ -z $SERVICE_CHOSEN_RESULT ]]
      then
        MAIN_MENU "I could not find that service. What would you like today?"
      else
        # Ask for phone number
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_PHONE_RESULT=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        # If phone number not in database
        if [[ -z $CUSTOMER_PHONE_RESULT ]]
          then 
            # Call ADD_NAME_NUMBER function
            ADD_NAME_NUMBER
        fi
        SET_APPOINTMENT
    fi
  else
    MAIN_MENU "I could not find that service. What would you like today?"
  fi
}

MAIN_MENU

