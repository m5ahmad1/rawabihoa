<?php
require_once "Classes/PHPExcel.php";

if(isset($_POST['upload']) && $_FILES['userfile']['size'] > 0)
{

//read the file contents
$fileName = $_FILES['userfile']['name'];
$tmpName  = $_FILES['userfile']['tmp_name'];
$fileSize = $_FILES['userfile']['size'];
$fileType = $_FILES['userfile']['type'];


//open the reader via PHPExecl
$excelReader = PHPExcel_IOFactory::createReaderForFile($tmpName);
$excelObj = $excelReader->load($tmpName);
$worksheet = $excelObj->getSheet(0);
$lastRow = $worksheet->getHighestRow();

//prepare server configuration
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

//set the right encoding for the connection
if (!$conn->set_charset("utf8")) {
      printf("Error loading character set utf8: %s\n", $conn->error);
  } else {
      printf("Current character set: %s\n", $conn->character_set_name());
  }

//loop through the file contens to get the required fields
for ($row = 2; $row <= $lastRow; $row++) {
       $x0= $worksheet->getCell('A'.$row);
      $GetIdNei= $x0->getValue();

      //Becouse data enter as Makmata (02-10)


      $SpaceNei = preg_replace('/\s+/', '', $GetIdNei);//Delete White Space Makmata (02-12)

      $data = explode('(' , rtrim($SpaceNei, ')'));   //Get Each Element individually
      $Neighborhood = $data[0];
      $RawabiCode = $data[1];

      $NeiID ="";
      $sqlGetNeigIDQuery = "SELECT id FROM uf_neighborhood 
      WHERE  neighborhood_en LIKE '$Neighborhood%'";    
       $NeiIDResult = $conn->query($sqlGetNeigIDQuery);
      if ($NeiIDResult->num_rows > 0) {
        $NeiID =  $NeiIDResult->fetch_assoc()["id"]; 
      }
      $x1= $worksheet->getCell('B'.$row)->getValue();    

      $x2= $worksheet->getCell('C'.$row)->getValue();   
    
      // $x3= $worksheet->getCell('D'.$row)->getValue();    
      $x4= $worksheet->getCell('D'.$row)->getValue();   

   $KeyHanding = $worksheet->getCell('E'.$row);
   $KeyHandingDate= $KeyHanding->getValue();
   if(PHPExcel_Shared_Date::isDateTime($KeyHanding)) {
      $KeyHandingDate = date($format = "Y-m-d", PHPExcel_Shared_Date::ExcelToPHP($KeyHandingDate)); 
    }

   $sql = "INSERT INTO uf_unit (neighborhood,owner_name,phone,rawabicode,topocode,key_handing)
     VALUES ('$NeiID','$x1','$x2','$RawabiCode','$x4','$KeyHandingDate') ";    
   

    if($x1!='unit'){
      if ($conn->query($sql) === TRUE) {
           
        header("Location: createunit");
          
          } 
       else {
          echo "Error: " . $sql . "<br>" . $conn->error;
         
          }
    
    }
      else{
      
        header("Location: 404");
      
      }
}

$conn->close();
    
}
exit();
?>

