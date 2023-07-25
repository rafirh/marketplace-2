<?php 
include 'config.php';

ini_set ('display_errors', 'On');
$koneksi = new mysqli($db_host, $db_username, $db_password, $db_name);