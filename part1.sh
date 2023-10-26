#!/bin/bash
# Default username = admin
# Default password = password

# Declare Arrays
declare -a records
declare -a users

# Default Credentials
users+=("admin, password, , ,read-write")

# Login Prompt
login(){
    read -p "Enter your username: " username
    read -p "Enter your password: " password
}

# Display Login Prompt
login

# Check login attempt
successful_login=false

for user in "${users[@]}"; do
    IFS="," read -r -a user_info <<< "$user"
    known_username="${user_info[0]}"
    known_password="${user_info[1]}"
    known_permissions="${user_info[4]}"

    if ["$username" == "$known_username"] && ["$password" == "$known_password"]; then
        successful_login=true
        permissions="$known_permissions

# Display Menu
display_menu(){
echo *****************
echo "1 = View Books"
echo "2 = Add Book"
echo "3 = Add User"
echo "4 = Search"
echo "5 = Exit"
echo *****************
read -p "Choose an option"
}

# View Books
view_books(){
    for book in "${records[@]}"; do
        echo "$book"
    done
    read -p "Press Enter to return to menu"
}

# Add a book
add_book(){
    read -p "Enter Book Title: " title
    read -p "Enter Author's Forename: " author_forename
    read -p "Enter Author's Surname: " author_surname
    read -p "Enter Year of Publishing: " year
    read -p "Enter Serial Number: " serial

    book_details="$title, $author_forename, $author_surname, $year, $serial"
    records+=("$book_details")
    echo "Book added to library"
    read -p "Press Enter to return to menu"
}

# Add a user
add_user(){
    read -p "Enter New Username: " username
    read -p "Enter New Password: " password
    read -p "Enter the Forename: " user_forename
    read -p "Enter the Surname: " user_surname
    read -p "Choose Permissions: " permissions
}