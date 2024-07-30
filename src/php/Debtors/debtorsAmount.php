<?php 
  include '../global/index.php';

  $request = json_decode(file_get_contents("php://input"));
  $requestid = json_decode($_GET['userId'], true);

  if($requestid != null) {
    $retrieve = mysqli_query($connect,"SELECT SUM(Amount) AS Total FROM debtors WHERE UserId = '$requestid'");
    $all = [];
    $fetch = mysqli_fetch_assoc($retrieve);
    $all['total'] = $fetch['Total'];
    $all['number_format'] = number_format($fetch['Total'],0,'.',',');
    $response = new stdClass();
    $response->status = "ok";
    $response->data = $all;
    echo json_encode($response);
  } else {
    echo json_encode("Invalid Request");
  }
?>