-- Table to store user information
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Table to store recipes
CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    spoonacular_id INT,  -- External API recipe ID
    title VARCHAR(255),
    image_url VARCHAR(255),
    ingredients TEXT,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,  -- Foreign key to users
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Table to store meal plans
CREATE TABLE meal_plans (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),  -- Foreign key to users
    recipe_id INT REFERENCES recipes(id) ON DELETE CASCADE,  -- Foreign key to recipes
    day_of_week VARCHAR(20) NOT NULL,  -- E.g., "Monday"
    meal_type VARCHAR(20) NOT NULL,    -- E.g., "Breakfast", "Lunch", "Dinner"
    created_at TIMESTAMP DEFAULT NOW()
);

-- Table to store shopping lists
CREATE TABLE shopping_lists (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,  -- Foreign key to users
    ingredient VARCHAR(255) NOT NULL,  -- Store ingredients for the shopping list
    added_at TIMESTAMP DEFAULT NOW()
);