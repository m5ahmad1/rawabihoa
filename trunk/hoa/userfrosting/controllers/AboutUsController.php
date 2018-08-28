<?php
        
namespace UserFrosting;

class AboutUsController extends \UserFrosting\BaseController {

    protected static $_table_id = "about_us_members";
    
    public function __construct($app){
        $this->_app = $app;
    }

    public function insertAndCrop(){
        $post = $this->_app->request->post();
        $final_path = "images/members/noimage.png";

        if($post["membership"] == 'head') {
            if (AboutUsMembers::where('membership_type', '=', 'head')
            ->where('neighborhood_id', '=', $post["neighborhood"])->count() > 0) {
                exit("There can only be one head per neighborhood");
            }
        }

        $possibleFinalPath = AboutUsMembers::cropAndUploadImage();

        if ($possibleFinalPath != null) {
            $final_path = $possibleFinalPath;
        }

        $nameMem = $post["name"];
        $neighborhood = $post["neighborhood"];
        $membership = $post["membership"];
        $description = $post["description"];

        $about = new AboutUsMembers([
            "name" => $nameMem,
            "profile_pic_path" => $final_path,
            "neighborhood_id" => $neighborhood,
            "membership_type" => $membership,
            "description" => $description,
            "display" => 1,
        ]);

        $about->save();

        echo "Added Successfully";
    }

    public function getHeadMembers() {
        return json_encode(AboutUsMembers::select('*')
        ->join('uf_neighborhood', 'uf_about_us_members.neighborhood_id', '=', 'uf_neighborhood.id')
        ->where('uf_about_us_members.membership_type', '=', 'head')
        ->where('uf_about_us_members.display', '=', 1)
        ->orderBy('name', 'ASC')
        ->get());
    }

    public function getAllNeighborhoods() {
        return json_encode(Neighborhood::select('*')
        ->orderBy('neighborhood_en', 'ASC')
        ->get());
    }

    public function getNeighborhoodMembers($action) {
        $response = json_decode(Neighborhood::where('neighborhood_en', $action)->select('id')->get());
        if($response == null) {
            return $response;
        }
        $id = $response[0]->{'id'};
        return json_encode(AboutUsMembers::where('neighborhood_id', $id)->where('display', 1)
        ->orderBy('membership_type', 'ASC')
        ->orderBy('name', 'ASC')
        ->get());
    }

    public function getAllNeighborhoodMembers() {
        return json_encode(AboutUsMembers::join('uf_neighborhood', 'uf_about_us_members.neighborhood_id', '=', 'uf_neighborhood.id')
        ->select('uf_about_us_members.*', 'uf_neighborhood.neighborhood_en')
        ->orderBy('neighborhood_en', 'ASC')
        ->orderBy('membership_type', 'ASC')
        ->orderBy('name', 'ASC')
        ->get());
    }

    public function updateDisplay(){
        $post = $this->_app->request->post();

        if (isset($post['display'])) {
            $display = 1;
        }
        else {
            $display = 0;
        }

        $id = $post['id'];
        $about = AboutUsMembers::find($id);

        $about['display'] = $display;     
     
        $about->save();
    }

    public function deleteMember(){
        $post = $this->_app->request->post();

        $id = $post['id'];
        $about = AboutUsMembers::find($id);
        if($about === NULL) {
            return $id;
        }
        $about->delete();
    }

    public function getMemberInfo() {
        return json_encode(AboutUsMembers::join('uf_neighborhood', 'uf_about_us_members.neighborhood_id', '=', 'uf_neighborhood.id')
        ->select('uf_about_us_members.*', 'uf_neighborhood.neighborhood_en')
        ->where('uf_about_us_members.id', '=', $_GET["id"])
        ->get());
    }

    public function getAllMembers() {
        return json_encode(AboutUsMembers::all());
    }

    public function updateAndCrop() {
        $post = $this->_app->request->post();

        $id = $post['id'];
        $about = AboutUsMembers::find($id);

        if($post["membership"] == 'head') {
            if (AboutUsMembers::where('membership_type', '=', 'head')
            ->where('id', '<>', $post["id"])
            ->where('neighborhood_id', '=', $post["neighborhood"])->count() > 0) {
                exit("There can only be one head per neighborhood");
            }
        }

        $possibleFinalPath = AboutUsMembers::cropAndUploadImage();

        if ($possibleFinalPath != null) {
            $about['profile_pic_path'] = $possibleFinalPath;
        }

        $nameMem = $post["name"];
        $neighborhood = $post["neighborhood"];
        $membership = $post["membership"];
        $description = $post["description"];

        $about['name'] = $nameMem;
        $about['neighborhood_id'] = $neighborhood;
        $about['membership_type'] = $membership;
        $about['description'] = $description; 

        $about->save();

        echo "Edited Successfully";
    }

    public function editAboutUs() {

        $aboutContent = Configuration::where('name', 'about_us_content')->first();

        $textContentURL = "aboutTextContent.txt";
        $contentFile = fopen($textContentURL, "w") or die("Unable to open file!");
        $txt = $_POST['content'];
        fwrite($contentFile, $txt);
        fclose($contentFile);

        $aboutContent['value'] = $textContentURL;
        $aboutContent->save();

        if(!isset($_FILES['motto_image']) || !is_uploaded_file($_FILES['motto_image']['tmp_name'])) {

            return "done";
        }

        $info = getimagesize($_FILES['motto_image']['tmp_name']);
        switch($info[2])
        {
                case IMAGETYPE_JPEG:
                        break;
                case IMAGETYPE_PNG:
                        break;
                case IMAGETYPE_GIF:
                        break;
                default:
                        exit('Unsupported file type: '.$_FILES['motto_image']['type']);
        }

        $path = $_FILES['motto_image']['name'];
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        $uploads_dir = 'images/about';
        $name = basename(preg_replace('/\s+/', '', uniqid().microtime()."_aboutusmottoheader".".".$ext));
        $final_path = "$uploads_dir/$name";
        move_uploaded_file($_FILES["motto_image"]["tmp_name"], $final_path);

        $aboutImage = Configuration::where('name', 'about_us_pic_path')->first();

        $aboutImage['value'] = $final_path;

        $aboutImage->save();

        return "done";
    }
    
    public function getAboutUsContent() {
        $response = json_decode(Configuration::select('value')->where('name', 'about_us_content')
        ->orWhere('name', 'about_us_pic_path')->get());

        if($response == null) {
            exit("Problem in retrieving content");
        }

        $textContentURL = $response[0]->{'value'};

        $imageContentURL = $response[1]->{'value'};

        $textContent = file_get_contents($textContentURL);

        $aboutUsContent = array(
            0 => array('value' => $textContent),
            1 => array('value' => $imageContentURL)
        );

        return json_encode($aboutUsContent);
    }
}