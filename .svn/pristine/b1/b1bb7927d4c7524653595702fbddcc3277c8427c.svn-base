<?php
        
namespace UserFrosting;
use \Illuminate\Database\Capsule\Manager as Capsule;
class UnitspaymentsController extends \UserFrosting\BaseController {

    protected static $_table_id = "unitspayments";
    
        /**s
     * Create a new UserController object.
     *
     * @param UserFrosting $app The main UserFrosting app.
     */
    public function __construct($app){
        $this->_app = $app;
    } 

    
     public function get(){

		 $unitsP=new CUnit();
      $unitsPayments=$unitsP->getUnitsPaymentsByDefualtNeighborhood();
        return json_encode($unitsPayments);
    }

    public function GetUnitsPaymentsByNeigh($neighborhood){
      $unitsP=new CUnit();
       $unitsPayments=$unitsP->GetUnitsPaymentsByNeigh($neighborhood);
        return json_encode($unitsPayments);
     }

     public function gett($userId){
     $unitsP=new CUnit();
      $unitsPayments=$unitsP->gettUnitsPayments($userId);
        return json_encode($unitsPayments);
    }

    public function getUnitDetails($userId){
      $unitDetails = new CUnit();
      $unitData = $unitDetails ->getUnitsDetails($userId);
      return json_encode($unitData); 

    }

    public function getUnitDetailsForUser($userId){
      $unitDetails = new CUnit();
      $unitData = $unitDetails ->getUnitsDetails($userId);
      return $unitData; 
    }
    public function  getUnitDetailsForUserActivation($user_id){
      $unitDetails = new CUnit();
      $unitData = $unitDetails ->getUnitsDetailsActivation($user_id);
      return $unitData; 
    }


  public function manageUnitBills($unitId , $year){
      $unitManage = new CUnit();
      $unitData = $unitManage ->manageUnitBills($unitId,$year);
      echo json_encode($unitData);
    }

    public function manageUnitBillsAll($unitId , $year){
      $unitManage = new CUnit();
      $unitData = $unitManage ->manageUnitBillsAll($unitId,$year);
      echo json_encode($unitData);
    }

    public function manageUnitBillsAllYears($unitId , $year){
      $unitManage = new CUnit();
      $unitData = $unitManage ->manageUnitBillsAllYears($unitId,$year);
      echo json_encode($unitData);
    }

  public function manageUnitBillsForUser($unitId , $year){
      $unitManage = new CUnit();
      $unitData = $unitManage ->manageUnitBillsForUser($unitId,$year);
      return $unitData;
    }

     public function set(){
       // Fetch the POSTed data
       $post = $this->_app->request->post();
       
       //Load the request schema
     // $requestSchema = new \Fortress\RequestSchema($this->_app->config('schema.path') . "/forms/createunit.json");
       
       // Get the alert message stream
      // $ms = $this->_app->alerts; 
    
       // Set up Fortress to process the request
       //$rf = new \Fortress\HTTPRequestFortress($ms, $requestSchema, $post);                    
        
       // Sanitize
      // $rf->sanitize();
        
       // Validate, and halt on validation errors.
      // if (!$rf->validate()) {
       //     $this->_app->halt(400);
       // }   
              
       // Get the filtered data
      // $data = $rf->data();
      //create new Discount

      $new_unit = new CUnit([
       
        "neighborhood" => $post['neighborhood'],
        "user_id" => $post['user_id'],
        "uf_unit"=> $post['uf_unit'],
      ]);
      $new_unit->save();

    }
	
	public function updateFinance()
	{

	   $post = $this->_app->request->post();
	 
		 $cuO=new CUnit();
		 $cuO->updateFinance($post);
			 

	}
  public function updateFixedBill()
  {  
      $post = $this->_app->request->post();
      $uO=new CUnit();
      $uO->updateFixedBill($post);
  }

  public function deleteFixedBill(){
     $post = $this->_app->request->post();
     $id=$post['id'];  
     $year=$post['year'];
     $link_table_fixed_bills_op = Database::getSchemaTable('fixed_bills_operations')->name; 
     $link_table_unit_bills = Database::getSchemaTable('bills')->name;
     $unitBills = Capsule::table($link_table_unit_bills)->where('year', $year)->delete();
     $fixedBill=Capsule::table($link_table_fixed_bills_op)->where('id', $id)->delete();
    
  }

  public function getFixedBill($year)
  {
    $unitsP=new CUnit();
    return $unitsP->getFixedBill($year);
  }
  public function getAllFixedBill()
  {
    $unitsP=new CUnit();
    echo $unitsP->getFixedBillAll();
  }

  public function assignFixedBills()
  {
     $post = $this->_app->request->post();
    $unitsP=new CUnit();
    //return $unitsPayments=$unitsP->assignFixedBills($post);
    return $unitsP->assignFixedBills($post);
    
  }

    public function updateUnit(){
      $post = $this->_app->request->post();
      // // Load the request schema
      // $requestSchema = new \Fortress\RequestSchema($this->_app->config('schema.path') . "/forms/discount-edit.json");
       
      //  // Get the alert message stream
      //  $ms = $this->_app->alerts; 
    
      //  // Set up Fortress to process the request
      //  $rf = new \Fortress\HTTPRequestFortress($ms, $requestSchema, $post);                    
        
      //  // Sanitize
      //  $rf->sanitize();
        
      //  // Validate, and halt on validation errors.
      //  if (!$rf->validate()) {
      //      $this->_app->halt(400);
      //  }
      $unitID=$post['uf_unit'];
      echo $post['uf_unit'];
      //$unit=CUnit::find($unitID);
      $unit=CUnit::where('uf_unit', $unitID)->first();
      $unit['neighborhood']=$post['neighborhood'];
      $unit['user_id']=$post['user_id'];
       //echo is_array($unit);
        //echo $unit;
      $unit->save();

     
     }
        public function deleteUnit(){
      // Fetch the POSTed data
      $post = $this->_app->request->post();
        $unitID=$post['uf_unit'];  
        $unit=CUnit::where('uf_unit', $unitID)->first();
        echo $unitID;
       $unit->delete();
    }
}