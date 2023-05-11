<?php
session_start();
session_destroy();
header("Location: http://localhost/demo/GTF/login.php");
exit;
?>
