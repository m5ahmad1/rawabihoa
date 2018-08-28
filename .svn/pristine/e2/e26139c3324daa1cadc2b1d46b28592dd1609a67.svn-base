<?php
$OutPut= '';
$servername = "localhost";
$username = "root";
$password ="";
$dbname = "userfrosting";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

if (!$conn->set_charset("utf8")) {
      printf("Error loading character set utf8: %s\n", $conn->error);
  } else {
      printf("Current character set: %s\n", $conn->character_set_name());
  }

	   $targetDir = "uploads/";
     $fileName = $_FILES['file']['name'];
     $curtime = time();
     $new_file_name=$curtime."_".$fileName;
      $targetFile = $targetDir.$new_file_name;



      if(preg_match('/\s/',$fileName)){
           $targetFile = str_replace(' ', '_', $targetFile);
           $new_file_name = str_replace(' ', '_', $new_file_name);
           // $targetFile = $targetDir.$fileName;  
         }
      if(move_uploaded_file($_FILES['file']['tmp_name'],$targetFile)){

         move_uploaded_file($tempFile, $targetFile);

         }

        $conn->query("INSERT INTO uf_files (file_name, uploaded,PostedDate,DisplayName) VALUES('".$new_file_name."','". date("Y-m-d H:i:s")."','". date("Y-m-d H:i:s")."','".$new_file_name."')");
?>
