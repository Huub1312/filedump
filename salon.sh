#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
SERVICE_ID_SELECTED=""
CUSTOMER_PHONE=""
CUSTOMER_NAME=""
SERVICE_TIME=""


echo -e "✴.·¯·.·★ 🎀Huubje's Salon🎀 ★·.·¯·.✴"

MAIN_MENU() {
    if [[ $1 ]]; then
        echo -e "\n$1"
    fi

    echo -e "\nWhy hello there darling, how can I help you?"

    LIST_OF_SERVICES=$($PSQL "SELECT * FROM services;")
    echo "$LIST_OF_SERVICES" | tr -d "|" | while read -r service_id SERVICE_NAME; do
        service_id=$(echo "$service_id" | xargs)
        SERVICE_NAME=$(echo "$SERVICE_NAME" | xargs)
        echo "$service_id) $SERVICE_NAME"
    done
    echo "0) Exit"

    read -r SERVICE_ID_SELECTED
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED" | xargs)
    case $SERVICE_ID_SELECTED in
        1) COLLECT_INFORMATION 1 "$SERVICE_NAME" ;;
        2) COLLECT_INFORMATION 2 "$SERVICE_NAME" ;;
        3) COLLECT_INFORMATION 3 "$SERVICE_NAME" ;;
        0) exit 0 ;;
        *) MAIN_MENU "Please enter a valid option." ;;
    esac

}

COLLECT_INFORMATION() {
SERVICE_ID_SELECTED=$(echo "$1" | xargs)
SERVICE_NAME=$(echo "$2" | xargs)
    echo -e "\nYour number please: "
    read -r CUSTOMER_PHONE
    NUMBER_LOOKUP=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z "$NUMBER_LOOKUP" ]]; then
        echo -e "\nYour name please: "
        read -r CUSTOMER_NAME
        $PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');"
    else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        echo -e "\nWelcome back,$CUSTOMER_NAME"
    fi

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    RESERVED_TIMES=$($PSQL "SELECT time FROM appointments;")

    if [[ -z "$RESERVED_TIMES" ]]; then
        echo "We have all the time in the world!"
        echo "What time would you like to book?"
    else
        echo "These are the times we are currently booked:"
        echo "$RESERVED_TIMES"
        sleep 2
        echo "What time would you like to book?"
    fi
    read -r SERVICE_TIME
    RESERVATION_TEST=$($PSQL "SELECT time FROM appointments WHERE time = '$SERVICE_TIME'")
    if [[ -z $RESERVATION_TEST ]]; then
        $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME');"
        echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
        exit 0
    else
        echo -e "\nSorry, that time slot is already booked. Please try again."
        COLLECT_INFORMATION "$SERVICE_ID_SELECTED"
    fi
}

MAIN_MENU
