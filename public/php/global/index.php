<?php
  header("Access-Control-Allow-Origin: *");
  header("Access-Control-Allow-Methods: GET,POST,PUT,DELETE");
  header("Access-Control-Allow-Headers: Content-Type");
  $connect = mysqli_connect('localhost','root','','loan_app');
  // $connect = mysqli_connect('localhost','root','8','kaizenhotel_loan_app');
  // $connect = mysqli_connect('localhost','kaizenhotel_loan_root','@Motive2015','kaizenhotel_loan_apppp');
?>  