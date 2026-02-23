USE tourism_db;

-- Insert sample users
INSERT INTO users (email, password_hash, first_name, last_name, user_type) VALUES
('admin@tourism.com', '$2a$10$hash', 'Admin', 'User', 'admin'),
('guide1@tourism.com', '$2a$10$hash', 'John', 'Smith', 'guide'),
('tourist1@tourism.com', '$2a$10$hash', 'Jane', 'Doe', 'tourist');

-- Insert guide profile
INSERT INTO guides (user_id, bio, languages, experience_years) VALUES
(2, 'Local expert with 5 years experience', 'English, Spanish', 5);

-- Insert sample experience
INSERT INTO experiences (guide_id, title, description, location, duration_hours, max_participants, price_per_person, category) VALUES
(1, 'Mountain Hiking Adventure', 'Explore beautiful mountain trails', 'Colorado', 4, 10, 75.00, 'adventure');
