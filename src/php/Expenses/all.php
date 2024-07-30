<?php 
  include '../global/index.php';

  $request = json_decode(file_get_contents("php://input"));
  $requestid = json_decode($_GET['userId'], true);
  if($requestid != null) {
    $month = date('m');
    $year = date('Y');

    $retrieve = mysqli_query($connect,"SELECT * FROM expenses WHERE `Month` = '$month' AND `Year` = '$year' AND UserId = '$requestid'");
    $all = [];
    while($fetch = mysqli_fetch_assoc($retrieve)){
      $fetch["number_format"] = number_format($fetch['Amount'],0,'.',',');
      array_push($all, $fetch);
    }

    $fetchdistinct = mysqli_query($connect, "SELECT DISTINCT Month, Year FROM expenses WHERE UserId = '$requestid' AND `Month` != '$month' ORDER BY `Month` ASC");
    $getdistinct = [];
    while($fetchh = mysqli_fetch_array($fetchdistinct, MYSQLI_ASSOC)){
      $eachMonth = $fetchh['Month'];
      if($eachMonth == 1){
        $monthName = "Jan";
      } else if($eachMonth == 2){
        $monthName = "Feb";
      } else if($eachMonth == 3){
        $monthName = "Mar";
      } else if($eachMonth == 4){
        $monthName = "Apr";
      } else if($eachMonth == 5){
        $monthName = "May";
      } else if($eachMonth == 6){
        $monthName = "Jun";
      } else if($eachMonth == 7){
        $monthName = "Jul";
      } else if($eachMonth == 8){
        $monthName = "Aug";
      } else if($eachMonth == 9){
        $monthName = "Sept";
      } else if($eachMonth == 10){
        $monthName = "Oct";
      } else if($eachMonth == 11){
        $monthName = "Nov";
      } else {
        $monthName = "Dec";
      }
      $fetchh["Month_Name"] = $monthName;
      $eachYear = $fetchh['Year'];

      $selectdistinct = mysqli_query($connect, "SELECT * FROM expenses WHERE `Month` = '$eachMonth' AND `Year` = '$eachYear' AND UserId = '$requestid'");
      while($fetchRec = mysqli_fetch_all($selectdistinct, MYSQLI_ASSOC)){
        $emptyArr = [];
        foreach($fetchRec as $records) {
          $records['number_format'] = number_format($records['Amount'],0,'.',',');;
          array_push($emptyArr, $records);
        }
        $fetchh['records'] = $emptyArr;
      }
      array_push($getdistinct, $fetchh);
    }
    $response = new stdClass();
    $response->status = "ok";
    $response->data = $all;
    $response->others = $getdistinct;
    echo json_encode($response);
  } else {
    echo json_encode("Invalid Request");
  }
?>