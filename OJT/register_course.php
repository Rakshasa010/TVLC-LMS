<?php
// Include database connection
include 'db/connection.php';

// Initialize variables
$response = array('status' => 'error', 'message' => '');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitize and validate input
    $name = trim($_POST['name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $phone = trim($_POST['phone'] ?? '');
    $education = trim($_POST['education'] ?? '');
    $course = trim($_POST['course'] ?? '');
    $payment_option = trim($_POST['payment_option'] ?? '');
    
    // Validate required fields
    if (empty($name) || empty($email) || empty($phone) || empty($education) || empty($course) || empty($payment_option)) {
        $response['message'] = 'All fields are required.';
        echo json_encode($response);
        exit;
    }
    
    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $response['message'] = 'Invalid email address.';
        echo json_encode($response);
        exit;
    }
    
    // Handle file upload for Valid ID
    $valid_id_path = '';
    if (isset($_FILES['valid_id']) && $_FILES['valid_id']['error'] === UPLOAD_ERR_OK) {
        $upload_dir = 'uploads/valid_ids/';
        // Create directory if it doesn't exist
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }
        $file_name = basename($_FILES['valid_id']['name']);
        $file_tmp = $_FILES['valid_id']['tmp_name'];
        $file_size = $_FILES['valid_id']['size'];
        $file_ext = strtolower(pathinfo($file_name, PATHINFO_EXTENSION));
        $allowed_types = ['png', 'jpg', 'jpeg', 'pdf'];
        // Validate file extension
        if (!in_array($file_ext, $allowed_types)) {
            $response['message'] = 'Invalid file type. Only PNG, JPG, JPEG, and PDF are allowed.';
            echo json_encode($response);
            exit;
        }
        // Validate file size (max 5MB)
        if ($file_size > 5 * 1024 * 1024) {
            $response['message'] = 'File size exceeds maximum allowed (5MB).';
            echo json_encode($response);
            exit;
        }
        // Generate unique filename
        $unique_filename = time() . '_' . uniqid() . '.' . $file_ext;
        $valid_id_path = $upload_dir . $unique_filename;
        // Move uploaded file
        if (!move_uploaded_file($file_tmp, $valid_id_path)) {
            $response['message'] = 'Failed to upload valid ID.';
            echo json_encode($response);
            exit;
        }
    } else {
        $response['message'] = 'Valid ID is required.';
        echo json_encode($response);
        exit;
    }
    
    // Prepare SQL statement
    $sql = "INSERT INTO course_registrations (name, email, phone, education_status, course_name, valid_id_path, payment_option, registration_date) 
            VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
    
    $stmt = $conn->prepare($sql);
    
    if ($stmt === false) {
        $response['message'] = 'Database error: ' . $conn->error;
        echo json_encode($response);
        exit;
    }
    
    // Bind parameters
    $stmt->bind_param('sssssss', $name, $email, $phone, $education, $course, $valid_id_path, $payment_option);
    
    // Execute statement
    if ($stmt->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'Registration successful! We will contact you soon at ' . htmlspecialchars($email) . '.';
    } else {
        $response['message'] = 'Error during registration: ' . $stmt->error;
    }
    
    $stmt->close();
} else {
    $response['message'] = 'Invalid request method.';
}

// Return JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
