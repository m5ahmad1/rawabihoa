<?php
        
namespace UserFrosting;

class TicketController extends \UserFrosting\BaseController {

    protected static $_table_id = "tickets";
    
    public function __construct($app){
        $this->_app = $app;
    }

    public function getUserID()
	{
		 if(isset($_SESSION["userfrosting"]["user_id"]) && ($_SESSION["userfrosting"]["user_id"] != null))
		 {
			return $_SESSION["userfrosting"]["user_id"];
		 }	
		 else
		 {
            return null;
		 }
	}

    public function sendTicket($user_id)  {
        $message = $_POST['message'];
        $ticket = new Ticket([
            "user_id" => $user_id,
            "message" => $message,
            "feedback" => "-"
        ]);
        $ticket->save();
        echo "Added Successfully";
    }

    public function changeTicketStatus()  {
        $status = $_POST['status'];
        $id = $_POST['id'];
        $ticket = Ticket::find($id);
        $ticket['status'] = $status;     
        $ticket->save();
        echo "Edited Successfully";
    }

    public function deleteTicket(){
        $id = $_POST['id'];
        $ticket = Ticket::find($id);
        $ticket->delete();
        echo "Deleted Successfully";
    }

    public function getUserTickets($user_id) {
        return json_encode(Ticket::join('uf_user', 'uf_tickets.user_id', '=', 'uf_user.id')
        ->select('uf_tickets.*', 'uf_user.user_name')
        ->where('uf_tickets.user_id', '=', $user_id)
        ->orderBy('status', 'DESC')
        ->orderBy('sent_at', 'DESC')
        ->get());
    }

    public function getAllTickets() {
        return json_encode(Ticket::join('uf_user', 'uf_tickets.user_id', '=', 'uf_user.id')
        ->select('uf_tickets.*', 'uf_user.user_name', 'uf_user.display_name')
        ->orderBy('status', 'DESC')
        ->orderBy('sent_at', 'DESC')
        ->get());
    }

    public function giveFeedbackAndChangeStatus() {
        $id = $_POST['id'];
        $ticket = Ticket::find($id);

        $ticket['status'] = $_POST['status']; 
        if (isset($_POST['feedback']))  {
            $ticket['feedback'] = $_POST['feedback'];
        }
        
        $ticket['feedback_sent_at'] = date('Y-m-d H:i:s');

        $ticket->save();
        
        echo "Edited Successfully";
    }
}