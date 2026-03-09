CREATE DATABASE recipe_db;
USE recipe_db;

CREATE TABLE ingredients (
    ingr_id     INT AUTO_INCREMENT PRIMARY KEY,
    ingr_name   VARCHAR(100) NOT NULL,
    category    ENUM('protein','vegetable','oil','spice','dairy','grain','other') NOT NULL, 
    unit        VARCHAR(20) NOT NULL
);

CREATE TABLE recipes (
    recipe_id   INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(150) NOT NULL,
    category    ENUM('breakfast','brunch','snack', 'main', 'dessert'),
    cuisine     VARCHAR(50),
    difficulty  ENUM('easy','medium','hard') NOT NULL DEFAULT 'medium',
    prot_type   ENUM('chicken','beef','turkey','tofu','grains','dairy') NOT NULL,
    prep_mins   INT,
    cook_mins   INT,
    servings    INT,
    instruct    TEXT NOT NULL,
    protein_gr  INT NOT NULL DEFAULT 0,      
    ref_url     VARCHAR(2000),
    tried       BOOLEAN
);

CREATE TABLE recipe_ingredients (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id   INT NOT NULL,
    ingr_id     INT NOT NULL,
    quantity    VARCHAR(20),
    notes       VARCHAR(100),
    CONSTRAINT fk_ri_recipe     FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id) ON DELETE CASCADE,
    CONSTRAINT fk_ri_ingredients FOREIGN KEY (ingr_id) REFERENCES ingredients(ingr_id) ON DELETE CASCADE
);

-- Recipe 1: Chili
INSERT INTO ingredients (ingr_name, category, unit) VALUES
    ('Virgin Olive Oil', 'oil', 'tbsp'),
    ('Garlic', 'vegetable', 'cloves'),
    ('White Onion', 'vegetable', 'units'),
    ('Bell Pepper', 'vegetable', 'units'),
    ('Carrot','vegetable', 'units'),
    ('Celery', 'vegetable', 'stalks'),
    ('Sweet Potato','vegetable', 'units'),
    ('Ground Turkey','protein', 'pounds'),
    ('Water', 'other','cups'),
    ('Tomato Sauce','other', 'cans'),
    ('Diced Tomatoes', 'vegetable', 'cans'),
    ('Chili Powder', 'spice', 'tbsp'),
    ('Ground Cumin', 'spice', 'tbsp'),
    ('Paprika', 'spice', 'tbsp'),
    ('Cayenne Pepper', 'spice', 'tsp'),
    ('Kosher Salt', 'spice', 'tsp'),
    ('Black Pepper', 'spice', 'tsp'),
    ('Red Pepper Flakes', 'spice', 'pinch'),
    ('Avocado', 'vegetable', 'units'),
    ('Jalapeño', 'vegetable', 'units'),
    ('Shredded Cheese', 'dairy', 'grams'),
    ('Greek Yogurt', 'dairy', 'tbsp'),
    ('Cilantro', 'vegetable', 'grams');
INSERT INTO recipes (title, category, cuisine, difficulty, prot_type, prep_mins, cook_mins, servings, instruct, protein_gr, ref_url, tried) VALUES
    ('Healthy Turkey Chili', 'main', 'American', 'easy', 'turkey', 20, 55, 8, '1. Heat the oil in a Dutch oven or large soup pot over medium heat. Add the garlic, onions, bell peppers, carrots, celery, and sweet potato. Sauté for 5 to 7 minutes, until soft.
    2. Add the turkey and cook until browned, 5 to 7 minutes, stirring often to break up the chunks.
    3. Once the meat is browned, add 1 1/2 cups water, tomato sauce, diced tomatoes in their juices, chili powder, cumin, paprika, cayenne, salt, black pepper, and red pepper flakes. Bring to a boil, then reduce to a moderate bubble. Let cook, uncovered, until the chili thickens, about 45 minutes, stirring every so often.
    4. Taste and adjust seasonings. Serve hot with desired toppings.', 
    24, 'https://www.wellplated.com/healthy-turkey-chili/', FALSE);
INSERT INTO recipe_ingredients (recipe_id, ingr_id, quantity, notes) VALUES
    (1, 1, '1', 'extra virgin'),
    (1, 2, '3', 'minced'),
    (1, 3, '2', 'diced'),
    (1, 4, '2', 'any color, cored and chopped'),
    (1, 5, '2', 'peeled and diced'),
    (1, 6, '2', 'diced'),
    (1, 7, '1', 'peeled and cubed, optional'),
    (1, 8, '2', '93% lean'),
    (1, 9, '1.5', 'more as needed'),
    (1, 10, '1', '15-ounce can'),
    (1, 11, '1', '14.5-ounce can, in their juices'),
    (1, 12, '3', NULL),
    (1, 13, '1', NULL),
    (1, 14, '1', NULL),
    (1, 15, '1', 'adjust for extra kick'),
    (1, 16, '1', NULL),
    (1, 17, '0.5', 'ground'),
    (1, 18, '1', NULL),
    (1, 19, NULL, 'topping'),
    (1, 20, NULL, 'topping, thinly sliced'),
    (1, 21, NULL, 'topping'),
    (1, 22, NULL, 'topping, or sour cream'),
    (1, 23, NULL, 'topping, freshly chopped');

-- Recipe 2: Arepa
INSERT INTO ingredients (ingr_name, category, unit) VALUES
    ('Corn Flour', 'grain', 'cups'),
    ('Mozzarella Cheese', 'dairy', 'cups'),
    ('Butter', 'oil', 'sticks');
INSERT INTO recipes (title, category, cuisine, difficulty, prot_type, prep_mins, cook_mins, servings, instruct, protein_gr, ref_url, tried) VALUES
    ('Colombian Arepa filled with cheese', 'breakfast', 'Colombian', 'easy', 'dairy', 30, 25, 10, '1. Add 2 cups of corn meal and 2 cups warm milk or water to a large bowl. Reserve the remaining ½ cup if needed. Add shredded mozzarella cheese and 2 pinches of salt.
    2. Form a ball with the dough. Flatten and form a bowl in your hand. Place shredded mozzarella inside and seal edges.
    3. Heat skillet to 320°F and rub with butter. Cook arepas until golden brown and cheese oozes.', 9, 'https://arepasdelgringo.com/make-arepas-de-queso-colombian-recipe/', TRUE);
INSERT INTO recipe_ingredients (recipe_id, ingr_id, quantity, notes) VALUES
    (2, 24, '2', 'plus 0.5 cup reserved if needed'),
    (2, 9, '2.5', 'warm'),
    (2, 25, '2', 'shredded, part in dough part as filling'),
    (2, 26, '0.5', 'for greasing skillet'),
    (2, 16, NULL, 'to taste');

-- Recipe 3: Chicken Fajita
INSERT INTO ingredients (ingr_name, category, unit) VALUES
    ('Chicken Breast', 'protein', 'units'), 
    ('Red Onion', 'vegetable', 'units'), 
    ('Red Pepper', 'vegetable', 'units'), 
    ('Red Chilli', 'vegetable', 'units'), 
    ('Ground Coriander', 'spice', 'tbsp'),  
    ('Lime', 'other', 'units'), 
    ('Tabasco', 'other', 'drops'),  
    ('Tortilla', 'grain', 'units'),  
    ('Mixed Salad', 'vegetable', 'grams'), 
    ('Fresh Salsa', 'other', 'grams');
INSERT INTO recipes (title, category, cuisine, difficulty, prot_type, prep_mins, cook_mins, servings, instruct, protein_gr, ref_url, tried) VALUES
    ('Easy Chicken Fajitas', 'main', 'Tex-Mex', 'easy', 'chicken', 15, 10, 4,
    '1. Heat oven to 200C/180C fan/gas 6 and wrap 8 medium tortillas in foil.
    2. Mix smoked paprika, ground coriander, a pinch of ground cumin, crushed garlic, olive oil, lime juice and Tabasco with salt and pepper.
    3. Stir sliced chicken breasts, red onion, red pepper and red chilli into the marinade.
    4. Heat a griddle pan until smoking hot and cook chicken and vegetables until charred, about 5 mins.
    5. Serve with warmed tortillas, mixed salad and fresh salsa.',
    25, 'https://www.bbcgoodfood.com/recipes/easy-chicken-fajitas', FALSE);
INSERT INTO recipe_ingredients (recipe_id, ingr_id, quantity, notes) VALUES
    (3, 27, '2', 'finely sliced'),
    (3, 28, '1', 'finely sliced'),
    (3, 29, '1', 'sliced'),
    (3, 30, '1', 'finely sliced, optional'),
    (3, 14, '1', 'smoked'),
    (3, 31, '1', NULL),
    (3, 13, NULL, 'pinch'),
    (3, 2, '2', 'crushed'),
    (3, 1, '4', NULL),
    (3, 32, '1', 'juiced'),
    (3, 33, NULL, '4-5 drops'),
    (3, 34, '8', 'wrapped in foil, warmed in oven'),
    (3, 35, NULL, 'topping'),
    (3, 36, '230', 'topping'),
    (3, 16, NULL, 'to taste'),
    (3, 17, NULL, 'to taste');

-- Recipe 4: Breakfast yogurt bowl
INSERT INTO ingredients (ingr_name, category, unit) VALUES
    ('Greek Yogurt', 'dairy', 'cups'),
    ('Blueberries', 'other', 'cups'),
    ('Strawberries', 'other', 'cups'),
    ('Honey', 'other', 'tbsp'),
    ('Chia Seeds', 'other', 'tbsp');
INSERT INTO recipes (title, category, cuisine, difficulty, prot_type, prep_mins, cook_mins, servings, instruct, protein_gr, ref_url, tried) VALUES
    ('Greek Yogurt with Berries', 'breakfast', 'Personal', 'easy', 'dairy', 5, 0, 1,
    '1. Spoon Greek yogurt into a bowl.
    2. Add blueberries and sliced strawberries.
    3. Drizzle with honey and sprinkle chia seeds on top.
    4. Mix gently and serve immediately.', 
    15, NULL, TRUE);
INSERT INTO recipe_ingredients (recipe_id, ingr_id, quantity, notes) VALUES
    (4, 37, '1', NULL),
    (4, 38, '0.5', NULL),
    (4, 39, '0.5', 'sliced'),
    (4, 40, '1', 'drizzle'),
    (4, 41, '1', 'sprinkle');