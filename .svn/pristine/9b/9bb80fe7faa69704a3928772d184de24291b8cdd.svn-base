<?php

namespace UserFrosting;
use \Illuminate\Database\Capsule\Manager as Capsule;

class SheetUploaderController extends \UserFrosting\BaseController {
    
    public function __construct($app){
        $this->_app = $app;
    }

    public function readExcelFile(){
        //    $inputFileType = 'Xls';
        $inputFileType = 'Xlsx';
        //    $inputFileType = 'Xml';
        //    $inputFileType = 'Ods';
        //    $inputFileType = 'Slk';
        //    $inputFileType = 'Gnumeric';
        //    $inputFileType = 'Csv';

        $inputFileName = 'excelFile.xlsx';
        $sheetName = 'Show Room';

        /**  Create a new Reader of the type defined in $nputFileType  **/
        $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType); 
        $reader->setLoadSheetsOnly($sheetName);;   
        /**  Load $inputFileName to a Spreadsheet Object  **/
        $spreadsheet = $reader->load($inputFileName);    
        $worksheet = $spreadsheet->getActiveSheet()->toArray(null, true,true,true);   

        //echo $worksheet[5]['H'] . "<br>";
        //print_r( $worksheet[5]);
        //print_r($worksheet);

        $so = new SheetUploader();
        $so->uploadNamesToDB($worksheet);
        print ("success");
        
    }
    public function readExcelPay17(){
        $inputFileType = 'Xlsx';
        $inputFileName = 'excelFile.xlsx';
        $sheetName = 'Makmata-Showroom Payments2017';
        $year ='2017';

        /**  Create a new Reader of the type defined in $nputFileType  **/
        $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
        $reader->setLoadSheetsOnly($sheetName);;
        /**  Load $inputFileName to a Spreadsheet Object  **/
        $spreadsheet = $reader->load($inputFileName);
        $worksheet = $spreadsheet->getActiveSheet()->toArray(null, true,true,true);

        $sp = new SheetUploader();
        $sp->uploadPayToDB($worksheet, $year);
    }
    public function readExcelPay18(){

        $inputFileType = 'Xlsx';
        $inputFileName = 'excelFile.xlsx';
        $sheetName = 'Makmata-Showroom Payments2018';


        /**  Create a new Reader of the type defined in $nputFileType  **/
        $reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader($inputFileType);
        $reader->setLoadSheetsOnly($sheetName);;
        /**  Load $inputFileName to a Spreadsheet Object  **/
        $spreadsheet = $reader->load($inputFileName);
        $worksheet = $spreadsheet->getActiveSheet()->toArray(null, true,true,true);

        $spy = new SheetUploader();
        $spy->uploadPayToDB($worksheet, '2018');
    }
}

?>