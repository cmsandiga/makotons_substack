-- Create demo table exactly as described in Part 2 article
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(50) NOT NULL,
    name VARCHAR(40) NOT NULL,
    age INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create index on email (our main example from the series)
CREATE INDEX idx_users_email ON users(email);

-- Insert the exact sample data from Part 2 article
INSERT INTO users (id, email, name, age, created_at) VALUES
    ('6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'clara@example.com', 'Clara Santos', 25, '2024-01-15'),
    ('9c8e7f2a-4b5c-8d9e-1f2a-3b4c5d6e7f8a', 'maria@example.com', 'Maria Silva', 28, '2024-02-10'),
    ('4d3f8b1c-7e2f-9a8b-5c6d-7e8f9a0b1c2d', 'pedro@example.com', 'Pedro Lima', 32, '2024-03-05');

-- Add more users to create the B-tree structure from the article
-- This creates the exact structure: ana@, bob@, carlos@ in left page
INSERT INTO users (email, name, age, created_at) VALUES
    ('ana@example.com', 'Ana Rodriguez', 24, '2024-01-10'),
    ('bob@example.com', 'Bob Johnson', 35, '2024-01-20'),
    ('carlos@example.com', 'Carlos Mendoza', 29, '2024-01-25');

-- Add users for the middle page: clara@, luis@, maria@ (as shown in article)
INSERT INTO users (email, name, age, created_at) VALUES
    ('luis@example.com', 'Luis Garcia', 31, '2024-02-15');

-- Add users for the right page: pedro@, tom@, zoe@ (as shown in article)
INSERT INTO users (email, name, age, created_at) VALUES
    ('tom@example.com', 'Tom Wilson', 27, '2024-03-10'),
    ('zoe@example.com', 'Zoe Martinez', 26, '2024-03-15');

-- Add more records to ensure we get the multi-level B-tree structure
INSERT INTO users (email, name, age, created_at)
SELECT 
    'user' || LPAD(i::text, 4, '0') || '@example.com',
    'User ' || i,
    20 + (i % 40),
    '2024-01-01'::timestamp + (i || ' days')::interval
FROM generate_series(1, 10000) AS i;

-- Force statistics update to ensure proper query planning
ANALYZE users;