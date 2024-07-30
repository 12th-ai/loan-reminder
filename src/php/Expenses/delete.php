<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $expenseid = $request->expenseid;
  
  if ($request != null) {
    $delete = mysqli_query($connect, "DELETE FROM expenses WHERE Id = '$expenseid'");
    if ($delete) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Expense Deleted";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>