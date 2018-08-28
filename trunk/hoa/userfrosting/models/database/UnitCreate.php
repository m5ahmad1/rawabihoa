<?php
        
namespace UserFrosting;

use \Illuminate\Database\Capsule\Manager as Capsule;

class Unit extends UFModel {

    protected static $_table_id = "unit";
	
	/*public function payments($unit_id){

	    $link_table = Database::getSchemaTable('')->name;
        return Capsule::table($link_table)->where("unit_id",$unit_id)->get();

	}*/
	public function getUnitsByOwner($owner)
	{
		
		$link_table = Database::getSchemaTable('unit')->name;
        $res= Capsule::table($link_table)->where("user_id","abatta")->get();
		return $res;
	}
	
	public function getAllUnits()
	{
		$units = Unit::leftJoin('uf_user', 'uf_unit.user_id', '=', 'uf_user.id')
			->select('uf_user.display_name','uf_user.id AS user_id','uf_unit.*')
            ->get();
	
		for($i=0;$i<count($units); $i++)
		{		
				if($units[$i]['user_id']==null)
				{
					$units[$i]['display_name']="Not Assigned";
				}
				if($units[$i]['neighborhood']==null)
				{
					$units[$i]['neighborhood']="Not Assigned";
				}
				if(is_numeric($units[$i]['neighborhood'])){
					$neighborhood_id = (int)$units[$i]['neighborhood'];
					$neighborhood=Neighborhood::find($neighborhood_id);
					$units[$i]['neighborhood'] = $neighborhood['neighborhood_en'] ." - ".$neighborhood['neighborhood_ar'];
				

					//print_r($neighborhood['id']);
					//exit();
				}
				
			
		}
		
		return $units;
	
	}

	public function getAllUnitsForValidation()
	{
		$units = Unit::leftJoin('uf_user', 'uf_unit.user_id', '=', 'uf_user.id')
			->select('uf_user.display_name','uf_user.id AS user_id','uf_unit.*')
            ->get();
	
		for($i=0;$i<count($units); $i++)
		{		
				if($units[$i]['user_id']==null)
				{
					$units[$i]['display_name']="Not Assigned";
				}
				if($units[$i]['neighborhood']==null)
				{
					$units[$i]['neighborhood']="Not Assigned";
				}
					
				$neighborhood_id = (int)$units[$i]['neighborhood'];
				$units[$i]['neighborhood'] = $neighborhood_id;
			
		}
		
		return $units;
	
	}

	public function assignUnitToUser($unit_id,$user_id){
		Unit::where(['id'=> $unit_id])
                ->update(['pending_user'=> $user_id]);
	}

	public function ConverFromPendingOToOwner($unit_id,$user_id){
		Unit::where(['id'=> $unit_id])
                ->update(['pending_user'=> $user_id]);
	}

	public function getUnassignedNeighborhood()
	{
		$where= array('user_id' => null, 'pending_user' => null);
		$units = Unit::select('uf_unit.id','uf_unit.neighborhood')
			->where($where)
			->groupBy('uf_unit.neighborhood')
            ->get();
			
		// for($i=0;$i<count($units); $i++)
		// {
		// 		if($units[$i]['owner']==null)
		// 		{
		// 			$units[$i]['display_name']="Not Assigned";
		// 		}
				
				
			
		// }
			

		return $units;
		
		
	}
	
	public function getRCodeByNeighboorhood($neighborhood)
	{
		$where= array('neighborhood' => $neighborhood,"pending_user" => null,'user_id'=> null);
		$units = Unit::select('uf_unit.id','uf_unit.rawabicode')
			->where($where)
            ->get();
			
		return $units;
		
		
	}

	public function getTCodeByRCode($rc)
	{
		$where= array('uf_unit.rawabicode' => $rc);
		$units = Unit::select('uf_unit.id','uf_unit.topocode')
			->where('uf_unit.rawabicode','=',$where)
            ->get();
			
		return $units;
		
		
	}

	public function findbyUser($user_id,$active){
		$owner_column = "pending_user";
		if($active){
			$owner_column = "user_id";
		}
		$where= array($owner_column => $user_id);
		$units = Unit::select()
			->where($where)
            ->get();
		
		
		for ($i=0; $i < count($units); $i++) { 
			if(is_numeric($units[$i]['neighborhood'])){
				$neighborhood_id = (int)$units[$i]['neighborhood'];
				$neighborhood=Neighborhood::find($neighborhood_id);
				$units[$i]['neighborhood'] = $neighborhood['neighborhood_en'] ." - ".$neighborhood['neighborhood_ar'];
			}
		}
		return $units;
	}

	public function updatUnitOwner($user_id){

		$where= array("pending_user" => $user_id,'user_id'=> null);
		$units = Unit::select('uf_unit.id')
			->where($where)
            ->get();

        for ($i=0; $i <count($units) ; $i++) { 
        	$unit_id = $units[$i]['id'];
        	Unit::where(['id'=> $unit_id])
                ->update(['user_id'=> $user_id]);
        }
	}

	public function updateUserUnits($user_id,$units,$active){
	
		if($units !=""){
			$owner_column = "pending_user";
			if($active){
				$owner_column = "user_id";
			}
			$units = explode(",", $units);
			if(!empty($units)){
				Unit::where([$owner_column => $user_id])
	                ->update(['pending_user'=> null,'user_id'=> null]);

	            for ($i=0; $i < count($units) ; $i++) { 
	            	Unit::where(["id" => $units[$i]])
	                ->update([$owner_column=> $user_id]);
	            }
			}
			
        } 
        return true;                                             
	}

	public function getFixedBill($year)
    {
        $defaultFixedBillIfNotAssigned = "200";
        $link_table_fixed_bills_op = Database::getSchemaTable('fixed_bills_operations')->name;
        $fixed_bill                = Capsule::table($link_table_fixed_bills_op)->where('year', $year)->select('billAmount')->get();
        if ($fixed_bill == null) {
            $currYear = date('Y');
            if($year > $currYear || $year < 2017) {
                return null;
            }
            Capsule::table($link_table_fixed_bills_op)->insertGetId(['year' => $year,'billAmount' => $defaultFixedBillIfNotAssigned]);
            return $defaultFixedBillIfNotAssigned;
        } else {
            return $fixed_bill[0]['billAmount'];
        }

    }

	public function addBillsForAllYears($unitId) {
		$link_table_b = Database::getSchemaTable('bills')->name;
		$year = date('Y');
		for ($i = 2017; $i <= $year; $i++) {
			$fixedBill = $this->getFixedBill($i);
			$billsData = [];
			for ($j = 0; $j <= 11; $j++) {
				$billsData[$j] = $fixedBill;
			}
			Capsule::table($link_table_b)->insertGetId(['billAmount' => serialize($billsData),
			'unit_id' => $unitId,
			'year' => $i]);
		}
	}
}