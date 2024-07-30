<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $title = $request->title;
  $description = $request->description;
  $date = $request->date;
  $amount = $request->amount;
  $userid = $request->userid;

  $strtime = strtotime($date);
  $month =  date('m', $strtime);
  $year = date('Y', $strtime);
  

  if ($request != null) {
    $add = mysqli_query($connect, "INSERT INTO expenses VALUES (null, '$title', '$description', '$date', '$month', '$year', '$amount', '$userid')");
    if ($add) {
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Expense Added";
      echo json_encode($response);
    } else {
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Try Again";
      echo json_encode($response);
    }
  }
?>