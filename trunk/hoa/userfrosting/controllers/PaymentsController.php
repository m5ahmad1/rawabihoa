<?php
        
namespace UserFrosting;

class PaymentsController extends \UserFrosting\BaseController {

    protected static $_table_id = "payments";
    
        /**s
     * Create a new UserController object.
     *
     * @param UserFrosting $app The main UserFrosting app.
     */
    public function __construct($app){
        $this->_app = $app;
    }
  
    public function render(){
          $this->_app->render('config/Payments.twig', []);
    }

    public function getByUserId($id){
        
      $paymentArr = array();
			$payments=new Payments();
			$paymentArr=$payments->getPaymentsByUserId($id);
        return json_encode($paymentArr);

    } 


    public function getyear($year){
       $paymentArr = array();
        $unit = Unit::find($id);
        $payments_units=$unit->payments($id);
        foreach ($payments_units as $payments_unit){
          $payment_id=$payments_unit['payment_id'];
          $payment=Payments::find($payment_id);
          array_push($paymentArr,$payment);
        }
        return json_encode($paymentArr);    
    
   }
    public function getPaymentsId()
  {
    
    //$session = $this->_app->ci->session;
     if(isset($_SESSION["userfrosting"]["payments_id"]) && ($_SESSION["userfrosting"]["payments_id"] != null))
     {
      echo $_SESSION["userfrosting"]["payments_id"];
     }  
     else
     {
       echo null;
     }

  }
}