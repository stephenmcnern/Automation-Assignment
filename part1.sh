#!/bin/bash
# Default username = admin
# Default password = password

# Declare Arrays
declare -a records
declare -a users

# Default Credentials
users+=("admin,password, , ,read-write")

# Display Menu
display_menu(){
echo *****************
echo "1 = View Books"
echo "2 = Add Book"
echo "3 = Add User"
echo "4 = Search"
echo "5 = Exit"
echo *****************
read -p "Choose an option" option
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

# Search the library
search(){
    read -p "Enter a title or serial number: " search
    found=false
    for book in "${records[@]}"; do
        if [[ "$book" == *"$search"* ]]; then
            echo "$book"
            found=true
        fi
    done
    if [ "$found" = false ]; then
        echo "No results"
    fi
    read -p "Press Enter to return to the menu"
}


# Function to handle login
login(){
    read -p "Enter your username: " username
    read -p "Enter your password: " password
    successful_login=false

    for user in "${users[@]}"; do
        IFS="," read -r -a user_info <<< "$user"
        known_username="${user_info[0]}"
        known_password="${user_info[1]}"

        if [ "$username" = "$known_username" ] && [ "$password" = "$known_password" ]; then
            successful_login=true
            break
        fi
    done

    if [ "$successful_login" = false ]; then
        echo "Invalid Credentials"
    else
        echo "Login Successful"
    fi
}
login

# User Interaction
echo "Library Management System"

while [ "$successful_login" = false ]; do
    login
done

while true; do
    display_menu
    case $option in
        1) 
            view_books
            ;;
        2) 
            add_book
            ;;
        3) 
            add_user
            ;;
        4) 
            search
            ;;
        5) 
            exit
            ;;
    esac
done
