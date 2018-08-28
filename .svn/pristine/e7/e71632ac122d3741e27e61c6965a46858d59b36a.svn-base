<?php
        
namespace UserFrosting;

use \Illuminate\Database\Capsule\Manager as Capsule;

class Transaction extends UFModel {

    protected static $_table_id = "transactions";
	
	public function getAllTransactions()

	{ 
    	   $transactions = Transaction::leftjoin('uf_unit', 'uf_unit.id', '=',
    	   'uf_transactions.unit_id')->leftjoin('uf_user', 'uf_unit.user_id', '=', 
    	   'uf_user.id')
           ->select('uf_transactions.*','uf_unit.rawabicode','uf_unit.topocode','uf_user.display_name')->get();

		return $transactions;

	}

}