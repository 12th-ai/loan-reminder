<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $Id = $request->Id;
  $phone = $request->Phone;
  $firstname = $request->Firstname;
  $lastname = $request->Lastname;
  $email = $request->Email;
  $amount = $request->Amount;
  $madeDate = $request->MadeDate;
  $returnDate = $request->ReturnDate;
  
  if ($request != null) {
    $update = mysqli_query($connect, "UPDATE debtors SET Firstname = '$firstname', Lastname = '$lastname', Phone = '$phone', Email = '$email', Amount = '$amount', MadeDate = '$madeDate', ReturnDate = '$returnDate' WHERE Id = '$Id'");
    if ($update) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Debtor Updated";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>