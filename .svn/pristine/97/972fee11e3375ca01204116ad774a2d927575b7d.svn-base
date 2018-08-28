<?php
namespace UserFrosting;
use \Illuminate\Database\Capsule\Manager as Capsule;
class UploadedFiles extends UFModel
{
    protected static $_table_id = "files";
    
    public function getAllFiles()
    {
        $AllFiles = UploadedFiles::leftjoin('uf_neighborhood', 'uf_files.Neighborhood', '=', 'uf_neighborhood.id')->select('uf_files.*', 'uf_neighborhood.neighborhood_en')->get();
        
        return $AllFiles;
        
    }
    
    public function getAllYearFiles($year, $user_id)
    {
        
        $Neighborhood = UploadedFiles::select('uf_files.Neighborhood')->get();
        $Visible      = json_decode(UploadedFiles::select('uf_files.visible')->get(), true);
        
        
        
        for ($i = 0; $i < count($Neighborhood); $i++) {
            
            if ($Neighborhood[$i]['Neighborhood'] != 'All') {
                $Files = UploadedFiles::leftjoin('uf_unit', 'uf_files.Neighborhood', '=', 'uf_unit.neighborhood')->whereYear('PostedDate', '=', $year)->select('uf_files.*')->where('uf_unit.user_id', '=', $user_id)->where('uf_files.visible', '=', 1)->distinct()->orderBy('PostedDate','desc')->get();
            }
            
            
            
            if ($Neighborhood[$i]['Neighborhood'] == 'All') {
                $FilesAll = UploadedFiles::select('uf_files.*')->whereYear('PostedDate', '=', $year)->where('uf_files.Neighborhood', '=', 'All')->where('uf_files.visible', '=', 1)->distinct()->orderBy('PostedDate','desc')->get();
            }
            
            
        }

        if(empty($FilesAll) && !empty($Files)){
            $FilesForUsers = array_merge(json_decode($Files, true));
        }
        if(!empty($FilesAll) && empty($Files)){
            $FilesForUsers = array_merge(json_decode($FilesAll, true));
        }
        if(!empty($FilesAll) && !empty($Files)){
            $FilesForUsers = array_merge(json_decode($FilesAll, true),json_decode($Files, true));
        }
       
    
        // if (empty($FilesAll)) {
        //     $FilesForUsers = array_merge(json_decode($Files, true));
        // }
        // if(empty($Files)){
        //     $FilesForUsers = array_merge(json_decode($FilesAll, true));
        // }
        // if(!empty($FilesAll) && empty($FilesAll)) {
        //     $FilesForUsers = array_merge(json_decode($FilesAll, true),json_decode($Files, true));
        // }

        
        return $FilesForUsers;
        
    }
    
    
    public function getAllFilesUser($user_id)
    {
        
        $Neighborhood = UploadedFiles::select('uf_files.Neighborhood')->get();
        $Visible      = json_decode(UploadedFiles::select('uf_files.visible')->get(), true);
             
    
        for ($i = 0; $i < count($Neighborhood); $i++) {
            
            if ($Neighborhood[$i]['Neighborhood'] != 'All') {
                $Files = UploadedFiles::leftjoin('uf_unit', 'uf_files.Neighborhood', '=', 'uf_unit.neighborhood')->select('uf_files.*')->where('uf_unit.user_id', '=', $user_id)->where('uf_files.visible', '=', 1)->distinct()->get();
            }
            
                 
            if ($Neighborhood[$i]['Neighborhood'] == 'All') {
                $FilesAll = UploadedFiles::select('uf_files.*')->where('uf_files.Neighborhood', '=', 'All')->where('uf_files.visible', '=', 1)->distinct()->get();
            }
            
        }

        if(empty($Files)){
            $FilesForUsers = array_merge(json_decode($FilesAll, true));
        }
        
        if (empty($FilesAll)) {
            $FilesForUsers = array_merge(json_decode($Files, true));
        }
      
     
        if(!empty($FilesAll) && !empty($Files)) {
            $FilesForUsers = array_merge(json_decode($FilesAll, true),json_decode($Files, true));
        }

        
        return $FilesForUsers;
        
    }
    
}