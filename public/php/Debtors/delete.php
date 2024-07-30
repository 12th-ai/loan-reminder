<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $debtorid = $request->debtorid;
  
  if ($request != null) {
    $delete = mysqli_query($connect, "DELETE FROM debtors WHERE Id = '$debtorid'");
    if ($delete) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Debtor Deleted";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>