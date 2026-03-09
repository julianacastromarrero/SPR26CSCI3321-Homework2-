#My Recipe Hub
This README will contain all the requisites and the instructions to access the website and set the connection

##Prerequisites
- Node.js
- MySQL (v8)

## Setup
1. Clone repository
$ git clone
$ cd 

2. Install dependencies
$npm install

3. Setup database
$ mysql -u root -p < full_MySQL_script.sql

4. Modify .env 
$ DATABASE_HOST=localhost
$ DATABASE_USER=your_mysql_username
$ DATABASE_PASSWORD=your_mysql_password
$ DATABASE_NAME=recipe_db

5. Run the app
$ node app.js

6. Open browser
http://localhost:3000


##Database schema
- recipes --> Stores all recipe details
- ingredients --> Stores ingredient information
- recipe_ingredients --> Joins ingredients to recipes