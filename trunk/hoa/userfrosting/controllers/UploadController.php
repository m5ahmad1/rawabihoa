<?php

namespace UserFrosting;


use Birke\Rememberme\Storage\DB;

class UploadController extends \UserFrosting\BaseController {

    protected static $_table_id = "files";

    /**
     * Create a new UserController object.
     *
     * @param UserFrosting $app The main UserFrosting app.
     */
    public function __construct($app){
        $this->_app = $app;
    }


    public function getFiles()
    {
        $AllFiles =new UploadedFiles();
        
      return json_encode($AllFiles->getAllFiles());    
    
    }

      public function getFilesForUser($user_id)
    {
         $AllFiles =new UploadedFiles();     
      return json_encode($AllFiles->getAllFilesUser($user_id)); 
    }

    public function getFilesForUserWithYear($year,$user_id){     
      $AllFiles =new UploadedFiles();     
      return json_encode($AllFiles->getAllYearFiles($year,$user_id)); 
    }
    
  
    
     public function delete(){
         $post = $this->_app->request->post();
         $id=$post['id'];
         $FileId = UploadedFiles::find($id);
         $filename = $post['FileName'];
         unlink('uploads/'.$filename);
         $FileId->delete();
       
        
    }
    public function update(){
     $post = $this->_app->request->post();
     $id=$post['id'];
   
     $visible = (int) $post['visible'];

     $UpdateVisibleDB = UploadedFiles::where('uf_files.id','=',$id)
               ->update(['visible' =>  $visible]);

      $files=UploadedFiles::find($id); 
      $files['DisplayName']=$post['Neighborhood'];
      $files['Neighborhood']=$post['Neighborhood'];
      $files['DisplayName']=$post['DisplayName'];
      $files['PostedDate']=$post['PostedDate'];
      $files->save();   

     }   
}
