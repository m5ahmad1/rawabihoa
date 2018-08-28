<?php
        
namespace UserFrosting;

class TransactionController extends \UserFrosting\BaseController {

    protected static $_table_id = "transactions";
    
        /**
     * Create a new NeighborhoodController object.
     *
     * @param UserFrosting $app The main UserFrosting app.
     */
    public function __construct($app){
        $this->_app = $app;
    }
    
    public function get(){
		$transactions=new Transaction();
		
      return json_encode($transactions->getAllTransactions());    
    }

}