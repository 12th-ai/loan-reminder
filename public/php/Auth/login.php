<?php 
  include '../global/index.php';
  $request =  json_decode(file_get_contents("php://input"));
  $credential = $request->credential;
  $password = $request->password;

  if($request != NULL){
    $check = mysqli_query($connect,"SELECT * FROM users WHERE Phone = '$credential' AND Password = '$password' OR Email = '$credential' AND Password = '$password'");
    if(mysqli_num_rows($check) > 0){
      $fetch = mysqli_fetch_assoc($check);
      // $fetch['Password'] = "****";
      $response = new stdClass();
      $response->status = "ok";
      $response->message = "Redirecting....";
      $response->data = $fetch;
      echo json_encode($response);
    }else{
      $response = new stdClass();
      $response->status = "failed";
      $response->message = "Unknown Credentials";
      echo json_encode($response);
    }
  }
?>