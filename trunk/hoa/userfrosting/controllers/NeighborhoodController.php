<?php
        
namespace UserFrosting;

class NeighborhoodController extends \UserFrosting\BaseController {

    protected static $_table_id = "neighborhood";
    
        /**
     * Create a new NeighborhoodController object.
     *
     * @param UserFrosting $app The main UserFrosting app.
     */
    public function __construct($app){
        $this->_app = $app;
    }
    
    public function get(){
		$neighborhood=new Neighborhood();
		
      return json_encode($neighborhood->getAllNeighborhoods());    
    }

   public function getNeighborhoods(){

      $collection=Neighborhood::get();
      $sorted_groupedBy = $collection->sortBy('id', true)->groupBy('neighborhood_en');
      echo json_encode($sorted_groupedBy);
      }

    public function set(){


       $post = $this->_app->request->post();
	
		
	   if(!isset($post['neighborhood_en']))
	   {
			$post['neighborhood_en']=null;
	   }
     
      $new_neighbrhood = new Neighborhood([
        "neighborhood_en" => $post['neighborhood_en'],
        "neighborhood_ar" => $post['neighborhood_ar'],
      ]);

      $new_neighbrhood->save();
       echo $new_neighbrhood['id'];
    }


    public function update(){
      $post = $this->_app->request->post();
	     $id=$post['id'];
      $neighborhood=Neighborhood::find($id);
	  if(!isset($post['neighborhood_ar']))
	  {
		  $post['neighborhood_ar']=null;
	  }

      $neighborhood['neighborhood_en']=$post['neighborhood_en'];
      $neighborhood['neighborhood_ar']=$post['neighborhood_ar'];
	  
      
        $neighborhood->save();
       echo $neighborhood['id'];
    }


     public function delete(){
      // Fetch the POSTed data
      $post = $this->_app->request->post();
      $neighborhood_id=$post['neighborhood_id'];
      $neighborhood=Neighborhood::find($neighborhood_id);
        echo $neighborhood_id;
      $neighborhood->delete();
    }
   
    

}