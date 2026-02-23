USE tourism_db;

-- Insert admin user
INSERT INTO users (email, password_hash, first_name, last_name, user_type) VALUES
('admin@tourism.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'System', 'Admin', 'admin');

-- Insert guide users
INSERT INTO users (email, password_hash, first_name, last_name, phone, user_type) VALUES
('john.smith@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'John', 'Smith', '+1-555-0101', 'guide'),
('maria.garcia@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Maria', 'Garcia', '+1-555-0102', 'guide'),
('david.chen@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'David', 'Chen', '+1-555-0103', 'guide');

-- Insert tourist users
INSERT INTO users (email, password_hash, first_name, last_name, phone, user_type) VALUES
('sarah.jones@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Sarah', 'Jones', '+1-555-0201', 'tourist'),
('mike.brown@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Mike', 'Brown', '+1-555-0202', 'tourist'),
('emma.wilson@email.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Emma', 'Wilson', '+1-555-0203', 'tourist');

-- Insert guide profiles (user_ids 2, 3, 4 are guides)
INSERT INTO guides (user_id, bio, languages_spoken, years_experience, specialization) VALUES
(2, 'Certified mountain guide with 8 years of experience leading hiking and climbing expeditions. Passionate about local history and wildlife.', 'English, Spanish', 8, 'Mountain Adventures'),
(3, 'Culinary expert and food historian. I take visitors on authentic food tours through hidden local gems and traditional markets.', 'English, Spanish, French', 5, 'Food & Culture'),
(4, 'Professional photographer and nature guide. Specializing in wildlife photography tours and sunset landscape expeditions.', 'English, Mandarin', 6, 'Photography & Nature');

-- Insert experiences
INSERT INTO experiences (guide_id, title, description, location, duration_hours, max_participants, price_per_person, category, difficulty_level, meeting_point, included_items, requirements) VALUES
(1, 'Sunset Mountain Hike', 'Experience breathtaking mountain views on this guided hike to the summit. Perfect for photography enthusiasts and nature lovers. We will explore local flora and fauna while enjoying panoramic vistas.', 'Rocky Mountains, Colorado', 4, 12, 75.00, 'adventure', 'moderate', 'Mountain Base Visitor Center', 'Guided tour, safety equipment, snacks, water', 'Comfortable hiking shoes, weather-appropriate clothing, camera'),
(1, 'Beginner Rock Climbing', 'Learn the basics of rock climbing with professional instruction. All skill levels welcome. Safety equipment and personalized coaching provided.', 'Boulder Basin, Colorado', 3, 6, 120.00, 'adventure', 'easy', 'Climbing Gym Parking Lot', 'All climbing gear, helmet, harness, instruction', 'Closed-toe shoes, comfortable athletic wear'),
(2, 'Historic Downtown Food Tour', 'Taste your way through the citys culinary history. Visit 6 local eateries, sample traditional dishes, and learn about cultural influences on local cuisine.', 'Downtown Historic District', 3, 10, 65.00, 'food', 'easy', 'Main Square Fountain', 'All food tastings, guided tour, recipe booklet', 'Comfortable walking shoes, appetite'),
(2, 'Evening Wine & Tapas Crawl', 'Explore the vibrant nightlife through a curated selection of wine bars and tapas restaurants. Perfect for couples and groups.', 'Old Town Wine District', 4, 8, 95.00, 'food', 'easy', 'Metro Station Exit 3', 'Wine tastings, tapas pairings, guided tour', 'ID for alcohol verification'),
(3, 'Wildlife Photography Workshop', 'Capture stunning wildlife shots with expert guidance. Early morning tour to spot local deer, birds, and small mammals in natural habitat.', 'National Park North Trail', 5, 6, 150.00, 'nature', 'moderate', 'Park Ranger Station', 'Photography guide, location scouting, tips sheet', 'Camera with zoom lens, sturdy shoes, patience'),
(3, 'Golden Hour Landscape Shoot', 'Master landscape photography techniques during the magical golden hour. Learn composition, exposure, and timing.', 'Lake Viewpoint Trail', 2, 8, 85.00, 'nature', 'easy', 'Lake Parking Area', 'Photography instruction, location guide', 'Any camera or smartphone, tripod optional');

-- Insert seasonal pricing
INSERT INTO seasonal_pricing (experience_id, season_name, start_date, end_date, price_multiplier, is_peak_season) VALUES
(1, 'Summer Peak 2024', '2024-06-01', '2024-08-31', 1.25, TRUE),
(1, 'Fall Season 2024', '2024-09-01', '2024-11-30', 1.00, FALSE),
(2, 'Summer Peak 2024', '2024-06-01', '2024-08-31', 1.20, TRUE),
(3, 'Holiday Season 2024', '2024-12-01', '2024-12-31', 1.30, TRUE),
(4, 'Weekend Premium', '2024-01-01', '2024-12-31', 1.15, TRUE);

-- Insert sample bookings
INSERT INTO bookings (experience_id, tourist_id, booking_date, scheduled_date, num_participants, total_amount, status, payment_status) VALUES
(1, 5, '2024-01-15', '2024-02-10', 2, 150.00, 'confirmed', 'paid'),
(3, 5, '2024-01-20', '2024-02-15', 1, 65.00, 'confirmed', 'paid'),
(2, 6, '2024-01-18', '2024-02-20', 3, 360.00, 'pending', 'pending'),
(5, 7, '2024-01-22', '2024-03-01', 2, 300.00, 'confirmed', 'paid');

-- Insert revenue distribution for paid bookings
INSERT INTO revenue_distribution (booking_id, guide_amount, platform_amount, total_amount, payment_status) VALUES
(1, 127.50, 22.50, 150.00, 'paid'),
(2, 55.25, 9.75, 65.00, 'paid'),
(4, 255.00, 45.00, 300.00, 'paid');

-- Insert reviews for completed bookings
INSERT INTO reviews (booking_id, tourist_id, guide_id, experience_id, rating, review_text) VALUES
(1, 5, 1, 1, 5, 'Absolutely incredible experience! John was knowledgeable and made sure everyone was safe. The sunset views were unforgettable.'),
(2, 5, 2, 3, 4, 'Great food tour with delicious tastings. Maria really knows the local culinary scene. Would recommend bringing a bigger appetite!');

-- Update guide ratings based on reviews
UPDATE guides SET rating = 5.0, total_reviews = 1 WHERE guide_id = 1;
UPDATE guides SET rating = 4.0, total_reviews = 1 WHERE guide_id = 2;

-- Insert notifications
INSERT INTO notifications (user_id, type, title, message) VALUES
(2, 'booking', 'New Booking Received', 'You have a new booking for Sunset Mountain Hike on Feb 10, 2024'),
(3, 'booking', 'New Booking Received', 'New booking confirmed for Historic Downtown Food Tour'),
(5, 'booking', 'Booking Confirmed', 'Your booking for Sunset Mountain Hike is confirmed'),
(5, 'booking', 'Booking Confirmed', 'Your booking for Historic Downtown Food Tour is confirmed');

-- Insert demand analytics sample
INSERT INTO demand_analytics (experience_id, date_recorded, views_count, bookings_count, revenue_generated) VALUES
(1, '2024-01-15', 45, 3, 225.00),
(1, '2024-01-16', 52, 2, 150.00),
(2, '2024-01-15', 30, 1, 120.00),
(3, '2024-01-15', 38, 2, 130.00);
