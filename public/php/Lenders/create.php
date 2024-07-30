<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $firstname = $request->firstname;
  $lastname = $request->lastname;
  $phone = $request->contacts;
  $email = $request->email;
  $amount = $request->amount;
  $madeDate = $request->madeAt;
  $returnDate = $request->returnDate;
  $userid = $request->userid;
  
  if ($request != null) {
    $add = mysqli_query($connect, "INSERT INTO lenders VALUES('','$phone','$firstname','$lastname','$email','$amount','$madeDate','$returnDate','$userid')");
    if ($add) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Lender Added";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>
