<?php
        
namespace UserFrosting;

use \Illuminate\Database\Capsule\Manager as Capsule;
use UserFrosting\Unit;
use UserFrosting\User;
class Payments extends UFModel {

    protected static $_table_id = "payments";
 
   /* public function units(){
	    $link_table = Database::getSchemaTable('payments_unit')->name;
	    return $this->belongsToMany('UserFrosting\Unit', $link_table);
	}*/
	/*public function getUnits($unit_id){
	    $link_table = Database::getSchemaTable('payments_unit')->name;
        return Capsule::table($link_table)->where("unit_id",$unit_id)->get();
	}*/
	public function getPayments($unit_id){
	  
		return $this::where('unit_id',$unit_id)->get();
	}
	public function getPaymentsByUserId($user_id){
		
		
		$units = Unit::where('user_id','=',$user_id)
		    ->select('uf_unit.rawabicode','uf_unit.id AS unit_id')
            ->get();

			$idArr=[];
			foreach($units as $val)
			{
				array_push($idArr,$val['unit_id']);
			} 
			//echo (json_encode($units)); 
			//echo (json_encode($idArr)); 
			
		    $link_table = Database::getSchemaTable('bills')->name;
            $bills= Capsule::table($link_table)->whereIn('uf_bills.unit_id',$idArr)->leftjoin('uf_payments','uf_bills.id','=','uf_payments.bill_id')->select('uf_bills.*','uf_payments.payment_Amount')->get();
			//echo(json_encode($bills));
			$billsArr='';
			$key=$bills[0]['unit_id'];
			$j=0;
			for($i=0;$i<count($bills); $i++)
				{	
				
					$billsArr[$key][$j]=$bills[$i]['id'];
					$billsArr[$key][$j+1]= $bills[$i]['billDate'];
					$billsArr[$key][$j+2]= $bills[$i]['billAmount'];
					$billsArr[$key][$j+3]= $bills[$i]['paymentAmount'];
					$j+=4;
					if($i < count($bills)-1)
					{
						if($bills[$i+1]['unit_id'] != $key)
						{		
							
							$key=$bills[$i+1]['unit_id'];
							if(array_key_exists($key,$billsArr))
							{
								$j=count($billsArr[$key]);
							}
							else
							{
								$j=0;
							}							
						}
					}
				}
	
	
		
		$tmpArr='';
		$key=$units[0]['rawabicode'];
		$j=0;
		for($i=0;$i<count($units); $i++)
		{	
			
			$tmpArr[$key][$j] = $units[$i]['unit_id'];
				if(array_key_exists($units[$i]['unit_id'],$billsArr))
				{
					$tmpArr[$key][$j+1]=$billsArr[$units[$i]['unit_id']];
				}
				else
				{
					$tmpArr[$key][$j+1]=null;

				}
			$j+=2;
			if($i < count($units)-1)
			{
				if($units[$i+1]['rawabicode'] != $key)
				{		
					//array_push($res,$tmpArr);
					//$tmpArr='';
					$key=$units[$i+1]['rawabicode'];
					$j=0;		

				}
			}
		}
	//	array_push($res,$tmpArr);


		return $tmpArr;
		
		
		
		
		
		
		
		
		
	  /*   $link_table = Database::getSchemaTable('unit')->name;
		$payments = Unit::join('uf_user', 'uf_unit.user_id', '=', 'uf_user.id')
			->join('uf_payments','uf_unit.id','=','uf_payments.unit_id')   
			->where('uf_unit.user_id','=',$user_id)
			->select('uf_unit.rawabicode','uf_payments.*')
            ->get();
		//$res=[];
		$tmpArr='';
		$key=$payments[0]['rawabicode'];
		$j=0;
		for($i=0;$i<count($payments); $i++)
		{
			$tmpArr[$key][$j]=	$payments[$i]['paymentDate'];
			$tmpArr[$key][$j+1]=$payments[$i]['paymentAmount'];
			$tmpArr[$key][$j+2]= $payments[$i]['status'];
			$j+=3;
			if($i < count($payments)-1)
			{
				if($payments[$i+1]['rawabicode'] != $key)
				{		
					//array_push($res,$tmpArr);
					//$tmpArr='';
					$key=$payments[$i+1]['rawabicode'];
					$j=0;		

				}
			}
		}
		//array_push($res,$tmpArr);

		return $tmpArr;
		
		
		
		  */

	}

	
}