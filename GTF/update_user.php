<!DOCTYPE html>
<html>
<head>
  <title>User Profile</title>
  <style>
    body {
      background-color: white;
    }

    h1 {
      color: green;
    }

    .container {
      margin: 50px auto;
      width: 400px;
      background-color: white;
      padding: 20px;
      border: 1px solid green;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-group input {
      width: 100%;
      padding: 5px;
    }

    .form-group button {
      background-color: green;
      color: white;
      border: none;
      padding: 10px 20px;
      cursor: pointer;
    }
  </style>
</head>
<body>
<?php

$db_host = 'localhost';
$db_username = 'root';
$db_password = '';
$db_name = 'garbage_collection';


$conn = new mysqli($db_host, $db_username, $db_password, $db_name);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$user_id = 1; 
$sql = "SELECT name FROM users WHERE id = $user_id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $name = $row['name'];
}
?>
<div class="container">
  <h1>Welcome, <?php echo $name; ?></h1>
  <form action="update.php" method="POST">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="text" id="address" name="address" required>
    </div>
    <div class="form-group">
      <button type="submit">Update</button>
    </div>
  </form>
</div>
</body>
</html>
