var express    = require('express');
var app        = express();
var connection = require('./database').databaseConnection;

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));

// home
app.get('/', (req, res) => {
    res.render('pages/home');
});

// recipe list sorted by protein
app.get('/list', (req, res) => {
    let sql = 'SELECT * FROM recipes ORDER BY prot_type, title';
    connection.query(sql, (err, result) => {
        if (err) throw err;

        const grouped = {};
        result.forEach(recipe => {
            const key = recipe.prot_type;
            if (!grouped[key]) grouped[key] = [];
            grouped[key].push(recipe);
        });

        res.render('pages/list', { grouped });
    });
});

// recipe list by type of meal
app.get('/mealList', (req, res) => {
    let sql = 'SELECT * FROM recipes ORDER BY category, title';
    connection.query(sql, (err, result) => {
        if (err) throw err;

        const grouped = {};
        result.forEach(recipe => {
            const key = recipe.category;
            if (!grouped[key]) grouped[key] = [];
            grouped[key].push(recipe);
        });

        res.render('pages/mealList', { grouped });
    });
});

// single recipe
app.get('/recipe/:id', (req, res) => {
    let recipeSql = 'SELECT * FROM recipes WHERE recipe_id = ?';
    let ingredientSql = `
        SELECT i.ingr_name, i.category, i.unit,
               ri.quantity, ri.notes
        FROM recipe_ingredients ri
        JOIN ingredients i ON ri.ingr_id = i.ingr_id
        WHERE ri.recipe_id = ?
        ORDER BY i.category, i.ingr_name
    `;

    connection.query(recipeSql, [req.params.id], (err, recipeResult) => {
        if (err) throw err;
        if (recipeResult.length === 0) return res.status(404).send('Recipe not found');

        connection.query(ingredientSql, [req.params.id], (err2, ingredientResult) => {
            if (err2) throw err2;
            res.render('pages/recipe', {
                recipe:      recipeResult[0],
                ingredients: ingredientResult
            });
        });
    });
});

// add recipe
app.get('/addRecipe', (req, res) => {
    let sql = 'SELECT * FROM ingredients ORDER BY category, ingr_name';
    connection.query(sql, (err, result) => {
        if (err) throw err;
        res.render('pages/addRecipe', { ingredients: result });
    });
});
app.post('/add', (req, res) => {
    let recipeSql = `INSERT INTO recipes 
               (title, category, cuisine, difficulty, prot_type,
                prep_mins, cook_mins, servings,
                instruct, protein_gr, ref_url, tried)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, FALSE)`;

    connection.query(recipeSql, [
        req.body.title,
        req.body.category     || null,
        req.body.cuisine      || null,
        req.body.difficulty,
        req.body.prot_type,
        req.body.prep_mins    || null,
        req.body.cook_mins    || null,
        req.body.servings     || null,
        req.body.instruct,
        req.body.protein_gr   || 0,
        req.body.ref_url      || null
    ], (err, recipeResult) => {
        if (err) throw err;

        const recipeId = recipeResult.insertId;

        const existingIds = req.body.ingredients
            ? (Array.isArray(req.body.ingredients) ? req.body.ingredients : [req.body.ingredients])
            : [];

        const newNames      = req.body['new_ingr_name[]']     ? (Array.isArray(req.body['new_ingr_name[]'])     ? req.body['new_ingr_name[]']     : [req.body['new_ingr_name[]']])     : [];
        const newCategories = req.body['new_ingr_category[]'] ? (Array.isArray(req.body['new_ingr_category[]']) ? req.body['new_ingr_category[]'] : [req.body['new_ingr_category[]']]) : [];
        const newUnits      = req.body['new_ingr_unit[]']     ? (Array.isArray(req.body['new_ingr_unit[]'])     ? req.body['new_ingr_unit[]']     : [req.body['new_ingr_unit[]']])     : [];
        const newQtys       = req.body['new_ingr_qty[]']      ? (Array.isArray(req.body['new_ingr_qty[]'])      ? req.body['new_ingr_qty[]']      : [req.body['new_ingr_qty[]']])      : [];

        const validNew = newNames
            .map((name, i) => ({ name: name.trim(), category: newCategories[i], unit: newUnits[i].trim(), qty: newQtys[i] || null }))
            .filter(row => row.name && row.unit);

        function linkExisting(callback) {
            if (existingIds.length === 0) return callback();
            let values = existingIds.map(id => { const qty = req.body["ingr_qty_" + id] || null; return [recipeId, id, qty, null]; });
            connection.query(
                'INSERT INTO recipe_ingredients (recipe_id, ingr_id, quantity, notes) VALUES ?',
                [values],
                (err) => { if (err) throw err; callback(); }
            );
        }

        function insertNewIngredients(callback) {
            if (validNew.length === 0) return callback();
            let idx = 0;

            function insertOne() {
                if (idx >= validNew.length) return callback();
                const row = validNew[idx++];
                connection.query(
                    'INSERT INTO ingredients (ingr_name, category, unit) VALUES (?, ?, ?)',
                    [row.name, row.category, row.unit],
                    (err, result) => {
                        if (err) throw err;
                        const newIngrId = result.insertId;
                        connection.query(
                            'INSERT INTO recipe_ingredients (recipe_id, ingr_id, quantity, notes) VALUES (?, ?, ?, NULL)',
                            [recipeId, newIngrId, row.qty],
                            (err2) => { if (err2) throw err2; insertOne(); }
                        );
                    }
                );
            }
            insertOne();
        }

        linkExisting(() => insertNewIngredients(() => res.redirect('/list')));
    });
});

app.listen(3000, () => console.log('Running on http://localhost:3000'));