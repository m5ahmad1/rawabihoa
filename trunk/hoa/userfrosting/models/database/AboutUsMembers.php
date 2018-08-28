<?php
        
namespace UserFrosting;

use \Illuminate\Database\Capsule\Manager as Capsule;

class AboutUsMembers extends UFModel {

    protected static $_table_id = "about_us_members";

    public static function cropAndUploadImage() {
        if(isset($_FILES['image']) &&  is_uploaded_file($_FILES['image']['tmp_name'])) {

            if($_FILES['image']['error'] !== UPLOAD_ERR_OK)
                exit('Upload failed. Error code: '.$_FILES['image']['error']);

            switch(strtolower($_FILES['image']['type']))
            {
                    case 'image/jpeg':
                            $image = imagecreatefromjpeg($_FILES['image']['tmp_name']);
                            break;
                    case 'image/png':
                            $image = imagecreatefrompng($_FILES['image']['tmp_name']);
                            break;
                    case 'image/gif':
                            $image = imagecreatefromgif($_FILES['image']['tmp_name']);
                            break;
                    default:
                            exit('Unsupported type: '.$_FILES['image']['type']);
            }

            @unlink($_FILES['image']['tmp_name']);

            $old_width      = imagesx($image);
            $old_height     = imagesy($image);
            $new_width      = $_POST['orgwidth'];
            $new_height     = $_POST['orgheight'];

            $new0 = imagecreatetruecolor($new_width, $new_height);

            imagefill($new0, 0, 0, imagecolorallocate($new0, 255, 255, 255));

            imagecopyresampled($new0, $image, 
                    0, 0, 0, 0, 
                    $new_width, $new_height, $old_width, $old_height);

            $path = $_FILES['image']['name'];
            $ext = pathinfo($path, PATHINFO_EXTENSION);
            $uploads_dir = 'images/members';
            $name = basename(preg_replace('/\s+/', '', uniqid().microtime()."_".$_POST["name"].".".$ext));
            $final_path = "$uploads_dir/$name";

            imagedestroy($image);

            $image_quality = '95';

            $x1 = $_POST['x1'];
            $y1 = $_POST['y1'];
            $x2 = $_POST['x2'];
            $y2 = $_POST['y2'];
            $width = $_POST['width'];
            $height = $_POST['height'];     

            $crop_width = 300;
            $crop_height = 300;
            $new = imagecreatetruecolor($crop_width, $crop_height);
            imagecopyresampled($new, $new0, 0, 0, $x1, $y1, $crop_width, $crop_height, $width, $height);
            imagejpeg($new, $final_path, $image_quality);
            return $final_path;
        }
    return null;
    }
}