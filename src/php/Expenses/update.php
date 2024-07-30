<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $Id = $request->Id;
  $title = $request->Title;
  $description = $request->Description;
  $date = $request->Date;
  $amount = $request->Amount;
  // $userid = $request->userid;

  $strtime = strtotime($date);
  $month =  date('m', $strtime);
  $year = date('Y', $strtime);
  
  if ($request != null) {
    $update = mysqli_query($connect, "UPDATE expenses SET Title = '$title', `Description` = '$description',`Date` = '$date', `Month` = '$month', `Year` = '$year', Amount = '$amount'  WHERE Id = '$Id'");
    if ($update) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Expense Updated";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>