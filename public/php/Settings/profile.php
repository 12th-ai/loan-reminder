<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $Id = $request->UserId;
  $Firstname = $request->Firstname;
  $Lastname = $request->Lastname;
  $Email = $request->Email;
  $Phone = $request->Phone;
  
  if ($request != null) {
    $update = mysqli_query($connect, "UPDATE users SET Firstname = '$Firstname', Lastname = '$Lastname', Phone = '$Phone', Email = '$Email' WHERE UserId = '$Id'");
    if ($update) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Profile updated";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>