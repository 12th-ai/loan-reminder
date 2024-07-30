<?php
  include '../global/index.php';
  $request = json_decode(file_get_contents("php://input"));
  $firstname = $request->firstname;
  $lastname = $request->lastname;
  $phone = $request->phoneNumber;
  $email = $request->email;
  $password = $request->password;

  if($request != null){
    if($email == ''){
      $checkphone = mysqli_query($connect, "SELECT * FROM users WHERE Phone = '$phone'");
      if(mysqli_num_rows($checkphone) > 0){
        $response = new stdClass();
        $response->status = "failed";
        $response->message = "Phone number in use";
        echo json_encode($response);
      } else {
        $create = mysqli_query($connect, "INSERT INTO users VALUES('', '$firstname', '$lastname', '$phone', '$email', '$password')");
        if($create){
          $response = new stdClass();
          $response->status = "ok";
          $response->message = "Account Created";
          echo json_encode($response);
        }
      }
    } else {
      $check = mysqli_query($connect, "SELECT * FROM users WHERE Phone = '$phone' OR Email = '$email'");
      if(mysqli_num_rows($check) > 0){
        $response = new stdClass();
        $response->status = "failed";
        $response->message = "Phone number or Email in use";
        echo json_encode($response);
      } else {
        $create = mysqli_query($connect, "INSERT INTO users VALUES('', '$firstname', '$lastname', '$phone', '$email', '$password')");
        if($create){
          $response = new stdClass();
          $response->status = "ok";
          $response->message = "Account Created";
          echo json_encode($response);
        }
      }
    }
  }

  
  // if ($request != null) {
  //   $checkphone = mysqli_query($connect, "SELECT * FROM users WHERE Phone = '$phone' ");
  //   if (mysqli_num_rows($checkphone) > 0) {
  //     $response = new stdClass();
  //     $response->status = "failed";
  //     $response->message = "Phone number in use";
  //     echo json_encode($response);
  //   } else {
  //     $checkemail = mysqli_query($connect, "SELECT * FROM users WHERE Email = '$email'");
  //     if (mysqli_num_rows($checkemail) > 0) {
  //       $response = new stdClass();
  //       $response->status = "failed";
  //       $response->message = "Email in use";
  //       echo json_encode($response);
  //     } else {
  //       $create = mysqli_query($connect, "INSERT INTO users VALUES('', '$firstname', '$lastname', '$phone', '$email', '$password')");
  //       if ($create) {
  //         $response = new stdClass();
  //         $response->status = "ok";
  //         $response->message = "Account Created";
  //         echo json_encode($response);
  //       }
  //     }
  //   }
  // }
?>
