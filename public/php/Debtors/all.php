<?php 
  include '../global/index.php';
  
  $request = json_decode(file_get_contents("php://input"));
  $requestid = json_decode($_GET['userId'], true);
  
  if ($requestid != null) {
    $retrieve = mysqli_query($connect,"SELECT * FROM debtors WHERE UserId = '$requestid'");
    $all = [];
    while($fetch = mysqli_fetch_assoc($retrieve)){
      $fetch["number_format"] = number_format($fetch['Amount'],0,'.',',');
      array_push($all, $fetch);
    }
    $response = new stdClass();
    $response->status = "ok";
    $response->data = $all;
    echo json_encode($response);
  } else {
    echo json_encode("Invalid Request");
  }
?>