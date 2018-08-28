<?php

namespace UserFrosting;

use \Illuminate\Database\Capsule\Manager as Capsule;

class SheetUploader extends UFModel
{
    protected static $_table_id = "owner";

    public function uploadNamesToDB($worksheet) {
        foreach($worksheet as $key => $value){
            if( $key < 3 ){
                continue;
            }
            else if($key < 110){
                $name = $value['H'];
                $rCode = $value['F'];
                $expArr = explode(' ', $rCode, 2);
                $expArr2 = explode('(. ).', $expArr[1], 0);
                preg_match('#\((.*?)\)#', $expArr2[0] , $match);
                print $match[1];

                $link_table_owner = Database::getSchemaTable('owner')->name;
                $link_table_unit = Database::getSchemaTable('unit')->name;
                $ownerID = Capsule::table($link_table_owner)->insertGetId(['name' => $name]);
                Capsule::table($link_table_unit)->insertGetId(['user_id' => $ownerID, 'rawabicode'=> $match[1]]);
            }
            else{
                break;
            }
        }
    }

    public function uploadPayToDB($worksheet, $year){
        foreach($worksheet as $key => $value){
            if($key < 4){
                continue;
            }
            elseif ($key < 320 ){
                //get rawabiCode from excel sheet payments2017
                $rCode = $value['B'];
                $expArr = explode(' ', $rCode, 2);
                $expArr2 = explode('(. ).', $expArr[1], 0);
                preg_match('#\((.*?)\)#', $expArr2[0] , $match);
                //get payments from excell
                $payArray = array();
                for($col = 'G'; $col != 'S'; $col++) {
                    array_push($payArray, $value[$col]);
                }
                // serialized payArray
                $serialized_payArray=serialize($payArray);
//                print_r($value['D']);

                //print_r($match[1]);
                //get unit id where have the same rawabi code with excel sheet
                $units = Unit::where('rawabicode','=',$match[1])
                    ->select('uf_unit.id AS unit_id')
                    ->get();
                if(!$units){
                    continue;
                }
                else{
                    foreach($units as $key => $val){
                        print $val['unit_id'];
                        $link_table_payments = Database::getSchemaTable('payments')->name;
                        //$link_table_unit = Database::getSchemaTable('unit')->name;
                        Capsule::table($link_table_payments)->insertGetId(['payment_Amount' => $serialized_payArray, 'unit_id' => $val['unit_id'], 'year' => $year]);
                        //Capsule::table($link_table_unit)->insertGetId(['key_handing' => $value['D']]);

                    }
                }
            }
            else{
                break;
            }
        }


    }
}

?>