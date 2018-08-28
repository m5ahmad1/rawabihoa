<?php
        
namespace UserFrosting;

class UnitController extends \UserFrosting\BaseController {

    protected static $_table_id = "unit";
    
        /**
     * Create a new UserController object.
     *
     * @param UserFrosting $app The main UserFrosting app.
     */
    public function __construct($app){
        $this->_app = $app;
    }
    
    public function get(){
		$unit=new Unit();
		
      return json_encode($unit->getAllUnits());    
    }

    public function getTest(){
      $unit=new Unit();
      
        return json_encode($unit->getAllUnitsForValidation());    
      }
    public function UnassignedNeighborhood(){
      $unit=new Unit();
    
      return json_encode($unit->getUnassignedNeighborhood());    
    }

    public function RCodeByNeighboorhood($neighborhood){
      $unit=new Unit();

      return json_encode($unit->getRCodeByNeighboorhood($neighborhood));    
    }
    public function TCodeByRCode($rc){
      $unit=new Unit();

      return json_encode($unit->getTCodeByRCode($rc));    
    }
   
    public function set(){
       $post = $this->_app->request->post();
	   if(!isset($post['user_id']))
	   {
			$post['user_id']=null;
	   }
      $new_unit = new Unit([
          "neighborhood" => $post['neighborhood'],
          "user_id" => $post['user_id'],
          "dateofres" =>$post['dateofres'],
          "phone" =>"",
          "rawabicode" =>$post['rawabicode'],
          "topocode" =>$post['topocode'],
          "key_handing" => $post['key_handing'],
          "owner_name" => $post['owner_name'],

          ]);
      $new_unit->save();
      echo $new_unit['id'];
      $u = new Unit();
      $u->addBillsForAllYears($new_unit['id']);
    }


    public function update(){
      $post = $this->_app->request->post();
	     $id=$post['id'];
      $unit=Unit::find($id);
	  if(!isset($post['user_id']))
	  {
		  $post['user_id']=null;
	  }

      $unit['neighborhood']=$post['neighborhood'];
	    $unit['user_id']=$post['user_id'];
      $unit['phone']="";
      $unit['dateofres']=$post['dateofres'];
      $unit['key_handing']=$post['key_handing'];
      $unit['rawabicode']=$post['rawabicode'];
      $unit['topocode']=$post['topocode'];
      $unit['owner_name']=$post['owner_name'];
      
        $unit->save();
       echo $unit['id'];
    }


     public function delete(){
      // Fetch the POSTed data
      $post = $this->_app->request->post();
      $unit_id=$post['unit_id'];
      $unit=Unit::find($unit_id);
        echo $unit_id;
      $unit->delete();
    }
   
    

}