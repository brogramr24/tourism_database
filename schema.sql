CREATE DATABASE IF NOT EXISTS tourism_db;
USE tourism_db;

CREATE TABLE users ( 
    user_id INT AUTO_INCREMENT PRIMARY KEY,                                    // Users table  */
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    user_type ENUM('tourist', 'guide', 'admin') DEFAULT 'tourist',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE guides (                                                          // Guides table  */
    guide_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    bio TEXT,
    languages VARCHAR(255),
    experience_years INT,
    rating DECIMAL(2,1) DEFAULT 5.0,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE experiences (
    experience_id INT AUTO_INCREMENT PRIMARY KEY,                               // Experiences table  */
    guide_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255) NOT NULL,
    duration_hours INT,
    max_participants INT,
    price_per_person DECIMAL(10,2) NOT NULL,
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guide_id) REFERENCES guides(guide_id)
);

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,                                   // Bookings table  */
    experience_id INT NOT NULL,
    tourist_id INT NOT NULL,
    booking_date DATE NOT NULL,
    scheduled_date DATE NOT NULL,
    num_participants INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (experience_id) REFERENCES experiences(experience_id),
    FOREIGN KEY (tourist_id) REFERENCES users(user_id)
);

CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,                                  // Reviews table  */
    booking_id INT UNIQUE NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
