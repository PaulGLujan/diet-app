CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE foods (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    calories_per_serving DECIMAL(10, 2),
    serving_size DECIMAL(10, 2),
    serving_unit VARCHAR(50),
    nutrients JSON
);

CREATE TABLE eaten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    food_id INT,
    user_id INT,
    timestamp TIMESTAMP,
    amount_eaten DECIMAL(10, 2),
    meal_type VARCHAR(50),
    FOREIGN KEY (food_id) REFERENCES foods(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);