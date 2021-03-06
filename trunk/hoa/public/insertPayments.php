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
$PaymentsArr = array();
for ($row = 2; $row <= $lastRow; $row++) {
    $x1= $worksheet->getCell('A'.$row);
    $GetIdNei= $x1->getValue();
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

    $unitid="";
    $sqlGetUnitID = "SELECT id
            FROM uf_unit
            WHERE neighborhood = '$NeiID' and rawabicode = '$RawabiCode'";
     $IDResult = $conn->query($sqlGetUnitID);
     if ($IDResult->num_rows > 0) {
        $unitid =  $IDResult->fetch_assoc()["id"]; 
      }

    $x2= $worksheet->getCell('B'.$row)->getValue();
    $x3= $worksheet->getCell('C'.$row)->getValue();
    $x4= $worksheet->getCell('D'.$row)->getValue();
    $x5= $worksheet->getCell('E'.$row)->getValue();
    $x6= $worksheet->getCell('F'.$row)->getValue();
    $x7= $worksheet->getCell('G'.$row)->getValue();
    $x8= $worksheet->getCell('H'.$row)->getValue();
    $x9= $worksheet->getCell('I'.$row)->getValue();
    $x10= $worksheet->getCell('J'.$row)->getValue();
    $x11= $worksheet->getCell('K'.$row)->getValue();
    $x12= $worksheet->getCell('L'.$row)->getValue();
    $x13= $worksheet->getCell('M'.$row)->getValue();
      
      $PaymentsArr = Array();
      array_push($PaymentsArr,$x2,$x3,$x4,$x5,$x6,$x7,$x8,$x9,$x10,$x11,$x12,$x13);
      print_r($PaymentsArr);
      $PaymentsArrt = serialize($PaymentsArr);
 
    $x14= $worksheet->getCell('N'.$row)->getValue();
   

    $sql = "INSERT INTO  uf_payments (payment_Amount,unit_id,year)
    VALUES ('$PaymentsArrt','$unitid','$x14')";    
 
   
    if($x1!='unit'){
      if ($conn->query($sql) === TRUE) {
           
        header("Location:unit");
          
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

