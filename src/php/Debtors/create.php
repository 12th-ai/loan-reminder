<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $phone = $request->contacts;
  $firstname = $request->firstname;
  $lastname = $request->lastname;
  $email = $request->email;
  $amount = $request->amount;
  $madeDate = $request->madeAt;
  $returnDate = $request->returnDate;
  $idnumber = $request->idnumber;
  $reason = $request->reason;
  $userid = $request->userid;
  
  if ($request != null) {
    $add = mysqli_query($connect, "INSERT INTO debtors VALUES(null,'$firstname','$lastname','$phone','$email','$amount','$idnumber','$madeDate','$returnDate','$userid','$reason')");
    if ($add) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Debtor Added";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>