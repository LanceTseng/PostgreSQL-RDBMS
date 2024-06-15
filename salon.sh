#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

while true;
do
   SERVICE_INFO=$($PSQL "select * from services order by service_id")
  echo "$SERVICE_INFO" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
 read SERVICE_ID_SELECTED
  SERVICE_ID_SELECTED=$($PSQL "select service_id from services where service_id = $SERVICE_ID_SELECTED")
  if [[ ! -z $SERVICE_ID_SELECTED ]]
  then
    break
  fi

done

echo -e "\nPhone"
read CUSTOMER_PHONE
CUSTOMER_INFO=$($PSQL "select * from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_INFO ]]
then
  echo -e "\nName"
  read CUSTOMER_NAME
  
  INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers (phone, name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  
fi

CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

echo -e "\nTime"
read SERVICE_TIME
INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments (customer_id, service_id, time) values ($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME')")
if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
then
  APPOINTMENT_INFO=$($PSQL "SELECT c.name, s.name, a.time FROM appointments a LEFT JOIN customers c USING(customer_id) LEFT JOIN services s USING(service_id) where service_id=$SERVICE_ID_SELECTED and customer_id=$CUSTOMER_ID and time='$SERVICE_TIME'")
  echo "$APPOINTMENT_INFO" | while read NAME BAR SERVICE BAR TIME
  do
    echo "I have put you down for a $SERVICE at $TIME, $NAME."
  done
fi