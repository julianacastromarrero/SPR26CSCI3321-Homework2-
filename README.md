# My Recipe Hub
This README will contain all the requisites and the instructions to access the website and set the connection

## Prerequisites
- Node.js
- MySQL (v8)

## Setup
1. Clone repository
```
git clone git@github.com:julianacastromarrero/SPR26CSCI3321-Homework2-.git
cd SPR26CSCI3321-Homework2-.git
```

2. Install dependencies
```npm install```

3. Setup database
```mysql -u root -p < full_MySQL_script.sql```

4. Modify .env 
```
DATABASE_HOST=localhost
DATABASE_USER=your_mysql_username
DATABASE_PASSWORD=your_mysql_password
DATABASE_NAME=recipe_db
```

6. Run the app
```node app.js```

7. Open browser: ```http://localhost:3000```

## Database schema
- recipes --> Stores all recipe details
- ingredients --> Stores ingredient information
- recipe_ingredients --> Joins ingredients to recipes

## Organization
```
├───.env
├───app.js
├───database.js
├───full_MySQL_script.sql
├───package-lock.json
├───package.json
├───README.md
├───/node_modules
├───/public
│       theme.css
│
├───/recipe_db_sql_export
│       recipe_db_ingredients.sql
│       recipe_db_recipes.sql
│       recipe_db_recipe_ingredients.sql
│
└───/views
    ├───/pages
    │       addRecipe.ejs
    │       home.ejs
    │       list.ejs
    │       mealList.ejs
    │       recipe.ejs
    │
    └───/partials
            foot.ejs
            head.ejs
```
