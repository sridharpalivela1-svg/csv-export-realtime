-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create exports table
CREATE TABLE IF NOT EXISTS exports (
    id UUID PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    completed_at TIMESTAMP NULL,
    file_path TEXT NULL,
    total_rows INTEGER DEFAULT 0,
    processed_rows INTEGER DEFAULT 0,
    error TEXT NULL
);

-- Insert 100,000 users
INSERT INTO users (name, email)
SELECT 
    'User ' || g,
    'user' || g || '@example.com'
FROM generate_series(1, 100000) AS g;
