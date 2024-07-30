<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $lenderid = $request->lenderid;
  
  if ($request != null) {
    $delete = mysqli_query($connect, "DELETE FROM lenders WHERE Id = '$lenderid'");
    if ($delete) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Lender Deleted";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>