<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $Id = $request->UserId;
  // $current = $request->currentPassword;
  $new = $request->newPassword;
  
  if ($request != null) {
    $update = mysqli_query($connect, "UPDATE users SET Password = '$new' WHERE UserId = '$Id'");
    if ($update) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Password Changed";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>