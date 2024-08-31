#!/bin/bash

# Function to authenticate a new user
authenticate_user() {
    echo "Authenticating a new user..."
    gcloud auth login
}

# Function to switch to a different user
switch_user() {
    echo "List of authenticated accounts:"
    gcloud auth list

    echo "Enter the email of the account you want to switch to:"
    read ACCOUNT_EMAIL

    echo "Switching to $ACCOUNT_EMAIL..."
    gcloud config set account "$ACCOUNT_EMAIL"
}

# Function to revoke the active user's credentials
revoke_current_user() {
    echo "Revoking credentials of the current user..."
    gcloud auth revoke
}

# Function to list all authenticated accounts
list_users() {
    echo "Listing all authenticated accounts..."
    gcloud auth list
}

# Main menu
while true; do
    echo "--------------------------------------------"
    echo "Google Cloud User Management"
    echo "--------------------------------------------"
    echo "1. Authenticate a new user"
    echo "2. Switch to a different user"
    echo "3. Revoke the current user's credentials"
    echo "4. List all authenticated users"
    echo "5. Exit"
    echo "--------------------------------------------"
    echo "Enter your choice: "
    read choice

    case $choice in
        1) authenticate_user ;;
        2) switch_user ;;
        3) revoke_current_user ;;
        4) list_users ;;
        5) echo "Exiting..."; exit ;;
        *) echo "Invalid choice! Please try again." ;;
    esac
done
