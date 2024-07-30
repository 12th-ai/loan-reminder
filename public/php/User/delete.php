<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $userid = $request->userid;
  
  if ($request != null) {
    $delete = mysqli_query($connect, "DELETE FROM users WHERE UserId = '$userid'");
    if ($delete) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Account Deleted";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>