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



  
// include '../global/index.php';

// // Set content type to JSON
// header('Content-Type: application/json');

// // Decode the JSON request
// $request = json_decode(file_get_contents("php://input"));

// // Initialize the response object
// $response = new stdClass();

// if ($request != NULL) {
//     $credential = $request->credential;
//     $password = $request->password;

//     // Prepare and execute the SQL query
//     $stmt = $connect->prepare("SELECT * FROM users WHERE (Phone = ? AND Password = ?) OR (Email = ? AND Password = ?)");
//     $stmt->bind_param("ssss", $credential, $password, $credential, $password);
//     $stmt->execute();
//     $result = $stmt->get_result();

//     if ($result->num_rows > 0) {
//         $fetch = $result->fetch_assoc();
//         $response->status = "ok";
//         $response->message = "Redirecting....";
//         $response->data = $fetch;
//     } else {
//         $response->status = "failed";
//         $response->message = "Unknown Credentials";
//     }

//     // Close the statement
//     $stmt->close();
// } else {
//     $response->status = "failed";
//     $response->message = "Invalid request";
// }

// // Echo the response as JSON
// echo json_encode($response);


?>
