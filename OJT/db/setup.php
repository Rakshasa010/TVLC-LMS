<?php
// Database setup script - Creates the course_registrations table if it doesn't exist
include 'connection.php';

// Create course_registrations table
$sql = "CREATE TABLE IF NOT EXISTS course_registrations (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    education_status VARCHAR(100) NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    valid_id_path VARCHAR(500),
    payment_option VARCHAR(100) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_email_course (email, course_name)
)";

if ($conn->query($sql) === TRUE) {
    echo "Table 'course_registrations' created successfully or already exists.";
} else {
    echo "Error creating table: " . $conn->error;
}

$conn->close();
?>
