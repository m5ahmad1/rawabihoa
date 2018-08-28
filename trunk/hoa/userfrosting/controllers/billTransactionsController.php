<?php
        
namespace UserFrosting;

class billTransactionsController extends \UserFrosting\BaseController {

    protected static $_table_id = "bill_transactions";
    
    public function __construct($app){
        $this->_app = $app;
    }

    public function getAllTransactions() {
        return json_encode(billTransactions::leftJoin('uf_unit', 'uf_bill_transactions.unit_id', '=', 'uf_unit.id')
        ->leftJoin('uf_neighborhood', 'uf_neighborhood.id', '=', 'uf_unit.neighborhood')
        ->leftJoin('uf_user as owneru', 'uf_unit.user_id', '=', 'owneru.id')
        ->leftJoin('uf_user as adminu', 'uf_bill_transactions.executed_by', '=', 'adminu.id')
        ->select('uf_bill_transactions.*', 'adminu.user_name', 'adminu.display_name as admin_name', 'uf_unit.neighborhood', 'uf_unit.user_id', 
        'uf_unit.rawabicode', 'uf_unit.topocode', 'uf_neighborhood.neighborhood_en', 'owneru.display_name as owner_name')
        ->get());
    }
}