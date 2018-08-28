<?php
        
namespace UserFrosting;

use \Illuminate\Database\Capsule\Manager as Capsule;

class Neighborhood extends UFModel {

    protected static $_table_id = "neighborhood";
	
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
	
	public function getAllNeighborhoods()
	{
		$neighborhoods = Neighborhood::select('*')
            ->get();
			
		
		return $neighborhoods;
		
		
	}
  

	public function getUnassignedNeighborhood()
	{
		$units = Unit::select('uf_unit.id','uf_unit.neighborhood')
			->where('user_id', null)
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
		$where= array('neighborhood' => $neighborhood);
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
}