<?php
  header("Access-Control-Allow-Origin: *");
  header("Access-Control-Allow-Methods: GET,POST,PUT,DELETE");
  header("Access-Control-Allow-Headers: Content-Type");
  header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
  // Return HTTP 200 for preflight OPTIONS request
  http_response_code(200);
  exit;
}
  $connect = mysqli_connect('localhost','root','','loan_app');
  // $connect = mysqli_connect('localhost','kaizenhotel_root','@Motive2015','kaizenhotel_loan_app');
  // $connect = mysqli_connect('localhost','kaizenhotel_loan_root','@Motive2015','kaizenhotel_loan_apppp');
?>  