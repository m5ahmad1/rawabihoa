<?php
// This is the path to initialize.php, your site's gateway to the rest of the UF codebase!  Make sure that it is correct!
$init_path = "../userfrosting/initialize.php";

// This if-block just checks that the path for initialize.php is correct.  Remove this once you know what you're doing.
if (!file_exists($init_path)) {
    echo "<h2>We can't seem to find our way to initialize.php!  Please check the require_once statement at the top of index.php, and make sure it contains the correct path to initialize.php.</h2><br>";
}

require_once $init_path;

use UserFrosting as UF;

// Front page
$app->get('/', function () use ($app) {
    // This if-block detects if mod_rewrite is enabled.
    // This is just an anti-noob device, remove it if you know how to read the docs and/or breathe through your nose.
    if (isset($_SERVER['SERVER_TYPE']) && ($_SERVER['SERVER_TYPE'] == "Apache") && !isset($_SERVER['HTTP_MOD_REWRITE'])) {
        $app->render('errors/bad-config.twig');
        exit;
    }

    // Check that we can connect to the DB.  Again, you can remove this if you know what you're doing.
    if (!UF\Database::testConnection()) {
        // In case the error is because someone is trying to reinstall with new db info while still logged in, log them out
        session_destroy();
        // TODO: log out from remember me as well.
        $controller = new UF\AccountController($app);
        return $controller->pageDatabaseError();
    }

    // Forward to installation if not complete
    // TODO: Is there any way to detect that installation was complete, but the DB is malfunctioning?
    if (!isset($app->site->install_status) || $app->site->install_status == "pending") {
        $app->redirect($app->urlFor('uri_install'));
    }

    // Forward to the user's landing page (if logged in), otherwise take them to the home page
    // This is probably where you, the developer, would start making changes if you need to change the default behavior.
    if ($app->user->isGuest()) {
        $controller = new UF\AccountController($app);
        $controller->pageHome();
        // If this is the first the root user is logging in, take them to site settings
    } else if ($app->user->id == $app->config('user_id_master') && $app->site->install_status == "new") {
        $app->site->install_status = "complete";
        $app->site->store();
        $app->alerts->addMessage("success", "Congratulations, you've successfully logged in for the first time.  Please take a moment to customize your site settings.");
        $app->redirect($app->urlFor('uri_settings'));
    } else {
        $app->redirect($app->user->landing_page);
    }
})->name('uri_home');

/********** FEATURE PAGES **********/

$app->get('/UploadFiles/?', function () use ($app) {
        if (!$app->user->checkAccess('uri_upload')){
        //$app->redirect($app->site->uri['public']);$app->notFound();
        $app->redirect($app->site->uri['public']);
        }
       $controllerNeig   = new UF\NeighborhoodController($app);
       $neighborhood = $controllerNeig->get();
       $app->render('config/UploadFiles.twig',["neighborhood" => json_decode($neighborhood)]);
    });

$app->get('/SharedFiles/?', function () use ($app) { 
       $controller   = new UF\UploadController($app);
       $user_id = isset($_SESSION["userfrosting"]["user_id"]) ? $_SESSION["userfrosting"]["user_id"] : false;
       if (!$user_id) {
            $app->redirect($app->site->uri['public']);
       }
       //$files = $controller->getFilesForUser($user_id);

       $files = $controller->getFilesForUserWithYear(date("Y"),$user_id);
      
       $app->render('config/SharedFiles.twig',["files" => json_decode($files)]);

    });

$app->get('/GetAllFilesInYear/:year/?', function ($year) use ($app) {
   $controller = new UF\UploadController($app);
   $user_id = $_SESSION["userfrosting"]["user_id"];
   $files = $controller->getFilesForUserWithYear($year,$user_id);
   echo  $files;

});

$app->get('/upload/up/?', function () use ($app) {
    if (!$app->user->checkAccess('uri_upload')){
        $app->notFound();
    }
    $controller = new UF\UploadController($app);
    echo $controller->getFiles();
});


$app->delete('/deletefile/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_file')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\UploadController($app);
    return $controller->delete();

});

$app->post('/EditFile/?', function () use ($app) {

    $controller = new UF\UploadController($app);
    return $controller->update();

});

$app->post('/Units/assignFixedBills/?', function () use ($app) {
    //assign fixed bills to bills table
    $controller = new UF\UnitspaymentsController($app);
    echo $controller->assignFixedBills();

});

$app->get('/dashboard/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_dashboard')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }

    $app->render('dashboard.twig', []);
});

$app->get('/zerg/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_zerg')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }

    $app->render('users/zerg.twig');
});

$app->get('/excel/', function () use ($app) {
    $controller = new UF\SheetUploaderController($app);
    $controller->readExcelFile();
});
$app->get('/excelPay17/', function () use ($app) {
    $controller = new UF\SheetUploaderController($app);
    $controller->readExcelPay17();
});
$app->get('/excelPay18/', function () use ($app) {
    $controller = new UF\SheetUploaderController($app);
    $controller->readExcelPay18();
});


/********** ABOUT US ROUTING **********/

$app->get('/about-us/', function () use ($app) {

    $user_id = isset($_SESSION["userfrosting"]["user_id"]) ? $_SESSION["userfrosting"]["user_id"] : false;
    if (!$user_id) {
            $app->redirect($app->site->uri['public']);
    }
    $controller = new UF\AboutUsController($app);
    $heads = $controller->getHeadMembers();
    $json_array  = json_decode($heads, true);
    $elementCount  = count($json_array);
    $app->render('about-us.twig', array('heads' => $heads,
    'count' => $elementCount));
});

$app->get('/about-us/:action', function ($action) use ($app) {

    $user_id = isset($_SESSION["userfrosting"]["user_id"]) ? $_SESSION["userfrosting"]["user_id"] : false;
    if (!$user_id) {
            $app->redirect($app->site->uri['public']);
    }

    $controller = new UF\AboutUsController($app);
    $neighborhood = $controller->getNeighborhoodMembers($action);
    if ($neighborhood != null) {
        $json_array  = json_decode($neighborhood, true);
        $elementCount  = count($json_array);
        $app->render('about-us-members.twig', array('action' => $action, 'neighborhood' => $neighborhood,
        'membercount' => $elementCount));
        return;
    }

    if (!$app->user->checkAccess('uri_users') && $action != "content") {
        return $controller->page404();
    }
    
    switch ($action) {

        case "content": 
                echo $controller->getAboutUsContent();
                return;
        case "members":
                if(isset($_GET['id'])) {
                    echo $controller->getMemberInfo();
                    return;
                }
                $infomodal = 0;
                if(isset($_GET['infomodal'])) {
                    $infomodal = $_GET['infomodal'];
                }
                $neighborhoodmembers = $controller->getAllNeighborhoodMembers();
                $json_array  = json_decode($neighborhoodmembers, true);
                $elementCount  = count($json_array);
                $neighborhoods = $controller->getAllNeighborhoods();
                $json_array  = json_decode($neighborhoods, true);
                $neighborhoodCount  = count($json_array);
                $app->render('about-us-members.twig', array('action' => $action, 'neighborhood' => $neighborhoodmembers,
                'membercount' => $elementCount,
                'neighborhoods' => $neighborhoods,
                'count' => $neighborhoodCount,
                'infomodal' => $infomodal));
                return;
        default: 
                return $controller->page404();
    }
});

$app->post('/about-us/:action', function ($action) use ($app) {

    if (!$app->user->checkAccess('uri_users')) {
        return $controller->page404();
    }

    $controller = new UF\AboutUsController($app);

    switch ($action) {

        case "editAboutUs": 
                echo $controller->editAboutUs();
                return;

        case "upload-insert":
                echo $controller->insertAndCrop();      
                return;

        case "upload-edit": 
                echo $controller->updateAndCrop();       
                return;

        case "display":
                echo $controller->updateDisplay();
                return;

        case "delete":
                echo $controller->deleteMember();
                return;

        default: 
                return $controller->page404();
    }
});

/********** SEND A COMPLAINT ROUTING **********/

$app->get('/ticket/', function () use ($app) {
    $user_id = isset($_SESSION["userfrosting"]["user_id"]) ? $_SESSION["userfrosting"]["user_id"] : false;
    if (!$user_id) {
            $app->redirect($app->site->uri['public']);
    }
    $app->render('ticket.twig');
});

$app->get('/ticket/:action', function ($action) use ($app) {
    $controller = new UF\TicketController($app);
    switch ($action) {
        case "getUserTickets": 
                $userID = $controller->getUserID();
                if ($userID == null) {
                    exit("error in g etting user ID");
                }
                echo $controller->getUserTickets($userID);
                return;
        case "getAllTickets": 
                echo $controller->getAllTickets();
                return;
        default: 
                return $controller->page404();
    }
});

/* $app->get('/unitTest/', function () use ($app) {
    $app->render('unitPayment.twig');
}); */

$app->post('/ticket/:action', function ($action) use ($app) {
    $controller = new UF\TicketController($app);
    switch ($action) {
        case "send": 
                $userID = $controller->getUserID();
                if ($userID == null) {
                    exit("error in g etting user ID");
                }
                echo $controller->sendTicket($userID);
                return;
        case "giveFeedback":
                echo $controller->giveFeedbackAndChangeStatus();
                return;
        default: 
                return $controller->page404();
    }
});



/********** ACCOUNT MANAGEMENT INTERFACE **********/

$app->get('/account/:action/?', function ($action) use ($app) {
    // Forward to installation if not complete
    if (!isset($app->site->install_status) || $app->site->install_status == "pending") {
        $app->redirect($app->urlFor('uri_install'));
    }

    $get = $app->request->get();

    $controller = new UF\AccountController($app);

    $twig   = $app->view()->getEnvironment();
    $loader = $twig->getLoader();

    switch ($action) {
        case "login":return $controller->pageLogin();
        case "logout":return $controller->logout(true);
        case "register":return $controller->pageRegister();
        case "resend-activation":return $controller->pageResendActivation();
        case "forgot-password":return $controller->pageForgotPassword();
        case "activate":return $controller->activate();
        case "set-password":return $controller->pageSetPassword(true);
        case "reset-password":if (isset($get['confirm']) && $get['confirm'] == "true") {
                return $controller->pageSetPassword(false);
            } else {
                return $controller->denyResetPassword();
            }

        case "captcha":return $controller->captcha();
        case "settings":return $controller->pageAccountSettings();
        default:return $controller->page404();
    }
});
$app->post('/account/register1/?', function () use ($app) {
     $controller = new UF\AccountController($app);
        return $controller->register1();
});
$app->post('/account/Regret/?', function () use ($app) {
    $controller = new UF\AccountController($app);
       return $controller->SendRegretEmail();
});

$app->post('/account/:action/?', function ($action) use ($app) {
    $controller = new UF\AccountController($app);

    switch ($action) {
        case "login":return $controller->login();
        case "register":return $controller->register();
        case "resend-activation":return $controller->resendActivation();
        case "forgot-password":return $controller->forgotPassword();
        case "set-password":return $controller->setPassword(true);
        case "reset-password":return $controller->setPassword(false);
        case "settings":return $controller->accountSettings();
        default:$app->notFound();
    }
});

/********** USER MANAGEMENT INTERFACE **********/

$app->get('/GetUserUnitsForActivation/:user_id/?', function ($user_id) use ($app) {
    $controller = new UF\UnitspaymentsController($app);
              //Get UserID
                        //Get Unit Details Using UserID
           $getunitData = $controller->getUnitDetailsForUserActivation($user_id);
 
           $unitData = json_decode($getunitData, true);

     echo  json_encode($unitData);
 
 });

$app->get('//?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_createunit')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $app->render('createunit.twig', []);
});

// upload units from excel //
$app->get('/uploadUnits/?', function () use ($app) {
        if (!$app->user->checkAccess('uri_upload')){
        //$app->notFound();
        $app->redirect($app->site->uri['public']);
        }
         $controller   = new UF\NeighborhoodController($app);
         $neighborhood = $controller->get();
       $app->render('config/uploadunits.twig',["neighborhood" => json_decode($neighborhood)]);
    });


    $app->get('/UploadPayments/?', function () use ($app) {
        if (!$app->user->checkAccess('uri_upload')){
        //$app->notFound();
        $app->redirect($app->site->uri['public']);
        }
         $controller   = new UF\NeighborhoodController($app);
         $neighborhood = $controller->get();
       $app->render('config/UploadPayments.twig',["neighborhood" => json_decode($neighborhood)]);
    });


//payment transaction routing
$app->get('/paymentTransaction/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_alltransaction')) {
        //$app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
        $app->redirect($app->site->uri['public']);
    }
    $app->render('paymentTransaction.twig', []);
});

$app->get('/paymentTransaction/all', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_alltransaction')) {
        //$app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
        $app->redirect($app->site->uri['public']);
    }
    $controller = new UF\paymentTransactionsController($app);
    echo $controller->getAllTransactions();
    return;
});

$app->get('/billTransaction/all', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_alltransaction')) {
        //$app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
        $app->redirect($app->site->uri['public']);
    }
    $controller = new UF\billTransactionsController($app);
    echo $controller->getAllTransactions();
    return;
});


//transaction Page Routing
$app->get('/alltransaction/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_alltransaction')) {
        //$app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
        $app->redirect($app->site->uri['public']);
    }
    $app->render('transaction.twig', []);
});

$app->get('/transaction/all/?', function () use ($app) {
    $controller = new UF\TransactionController($app);
    echo $controller->get();
});

$app->get('//?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_yearpayment')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $app->render('yearpayment.twig', []);
});
//Year Payment Controller
$app->get('/yearpayment/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_yearpayment')) {
        //$app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
        $app->redirect($app->site->uri['public']);
    }
    $app->render('yearpayment.twig', []);
});

$app->get('/createunit/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_createunit')) {
        //$app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
        $app->redirect($app->site->uri['public']);
    }
    $controller   = new UF\NeighborhoodController($app);
    $neighborhood = $controller->get();

    $app->render('createunit.twig', ["neighborhood" => json_decode($neighborhood)]);

});

//payments Controller
$app->get('/payments/?', function () use ($app) {
            $controller = new UF\UnitspaymentsController($app);
             //Get UserID
             $user_id = isset($_SESSION["userfrosting"]["user_id"]) ? $_SESSION["userfrosting"]["user_id"] : false;
             if (!$user_id) {
                  $app->redirect($app->site->uri['public']);
             }
            //Get Unit Details Using UserID
            $getunitData = $controller->getUnitDetailsForUser($user_id);
            $unitData = json_decode($getunitData, true);
            $units = $unitData[0]['units'];

            foreach($units as $key => $unitData){
             
            $unitId = $unitData['id'];
            $year = date('Y');
            $units[$key]['bills'] = $controller->manageUnitBillsForUser($unitId,$year );

            }
        
    $app->render('config/payments.twig',["units" => $units]);

});

// datefilter onchange
$app->get('/getBillsandPayments/:year/?', function ($year) use ($app) {
   $controller = new UF\UnitspaymentsController($app);
             //Get UserID
          $user_id = $_SESSION["userfrosting"]["user_id"];
                       //Get Unit Details Using UserID
          $getunitData = $controller->getUnitDetailsForUser($user_id);

          $unitData = json_decode($getunitData, true);

          $units = $unitData[0]['units'];

          foreach($units as $key => $unitData){
            $unitId = $unitData['id'];
            $units[$key]['bills'] = $controller->manageUnitBillsForUser($unitId, $year);
            }
    echo  json_encode($units);

});

$app->get('/payments/:id/?', function ($id) use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_payments')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\PaymentsController($app);
    echo $controller->getByUserId($id);
});

$app->get('/getyear/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_getyear')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\PaymentsController($app);
    return $controller->getyear($year);
});
 

 //==============
  


$app->get('/neighborhood/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_createunit')) {
        //$app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
        $app->redirect($app->site->uri['public']);
    }
    $app->render('neighborhood.twig', []);
});
$app->get('/get-neighborhoods/?', function () use ($app) {
   $controller = new UF\NeighborhoodController($app);
    return $controller->getNeighborhoods();
});

$app->post('/createneighborhood/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_createunit')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\NeighborhoodController($app);
    return $controller->set();
});
$app->get('/neighborhood/all/?', function () use ($app) {
    $controller = new UF\NeighborhoodController($app);
    echo $controller->get();
});
$app->post('/neighborhood/edit/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_unit')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\NeighborhoodController($app);
    return $controller->update();

});

$app->delete('/deleteneighborhood/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_deleteunit')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\NeighborhoodController($app);
    return $controller->delete();

});

$app->get('/getRCodeByNeighboorhood/:neighborhood/?', function ($neighborhood) use ($app) {

    $controller = new UF\UnitController($app);
    echo $controller->RCodeByNeighboorhood($neighborhood);

});

$app->get('/getTCodeByRCode/:rc/?', function ($rc) use ($app) {

    $controller = new UF\UnitController($app);
    echo $controller->TCodeByRCode($rc);

});

$app->post('/createunit/?', function () use ($app) {
    // Access-controlled page

    if (!$app->user->checkAccess('uri_createunit')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\UnitController($app);

    return $controller->set();
});

$app->get('/createunit/all/?', function () use ($app) {
    $controller = new UF\UnitController($app);
    echo $controller->get();
});
$app->get('/createunit/allTest/?', function () use ($app) {
    $controller = new UF\UnitController($app);
    echo $controller->getTest();
});

$app->get('/createunit/getUsersList/?', function () use ($app) {
    $controller = new UF\UserController($app);
    echo $controller->getUsersList();
});

$app->get('/createunit/getUsersListt/?', function () use ($app) {
    $controller = new UF\UserController($app);
    echo $controller->getUsersListt();
});

$app->get('/createunit/getPaymentsList/?', function () use ($app) {
    $controller = new UF\PaymentsController($app);
     $controller->getPaymentsList();
});

 $app->post('/createunit/sendmail/?', function () use ($app) {    
        // Access-controlled page
        $controller = new UF\AccountController($app);
        return $controller->sendmail();
     });
 
     $app->get('/smtpMailConfig/?', function () use ($app) {    
        // Access-controlled page
        if (!$app->user->checkAccess('uri_site_mail')){
            $app->notFound();
        }
          $controller = new UF\SmtpMailConfigController($app);
          return $controller->getSmtpConfigTemplate();
    }); 

    $app->post('/smtpMailConfig/?', function () use ($app) {    
        // Access-controlled page
        $controller = new UF\SmtpMailConfigController($app);
        return $controller->setSmtpConfigTemplate();
     });

$app->post('/unit/edit/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_unit')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\UnitController($app);
    return $controller->update();

});

$app->delete('/deleteunit/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_deleteunit')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\UnitController($app);
    return $controller->delete();

});


//Unit rounte
$app->get('/unit/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_unit')) {
        //$app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
        $app->redirect($app->site->uri['public']);
    }
    $app->render('index.twig', []);
});

$app->post('/createunitinpayunits/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_createunitinpayunits')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\UnitspaymentsController($app);
    return $controller->set();
});


$app->post('/createunitinpayunits/edit/?', function () use ($app) {
    $post = $app->request->post();
    // Access-controlled page
    if (!$app->user->checkAccess('uri_createunitinpayunits')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $controller = new UF\UnitspaymentsController($app);
    
    return $controller->updateUnit();
});

$app->delete('/deleteunitfromunitspayments/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_deleteunitfromunitspayments')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }

    $controller = new UF\UnitspaymentsController($app);
    return $controller->deleteUnit();

});

$app->get('/GetDataUsingNei/:neighborhood/?', function ($neighborhood) use ($app) {
   
    $controller = new UF\UnitspaymentsController($app);
    echo $controller->GetUnitsPaymentsByNeigh($neighborhood);

});


$app->get('/getUnits/all/?', function () use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    echo $controller->get();
});
$app->get('/getUnitss/all/?', function () use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    $user_id = $_SESSION["userfrosting"]["user_id"];
    echo $controller->gett($user_id);

});

$app->get('/getUnitDetails/:userId/?', function ($userId) use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    echo $controller->getUnitDetails($userId);

});

$app->get('/manageUnitBills/:unitId/:year/?', function ($unitId , $year) use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    return $controller->manageUnitBills($unitId , $year);
});

$app->get('/manageUnitBillsAll/:unitId/:year/?', function ($unitId , $year) use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    return $controller->manageUnitBillsAll($unitId , $year);
});

$app->get('/manageUnitBillsAllYears/:unitId/:year/?', function ($unitId , $year) use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    return $controller->manageUnitBillsAllYears($unitId , $year);
});

$app->get('/getUnits/getFixedBill/all/?', function () use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    echo $controller->getAllFixedBill();

});

$app->get('/getUnits/getFixedBill/:year/?', function ($year) use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    echo $controller->getFixedBill($year);

});

$app->post('/getUnits/updateFixedBill/?', function () use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    return $controller->updateFixedBill();

});

$app->delete('/getUnits/deleteFixedBill/?', function () use ($app) {

    $controller = new UF\UnitspaymentsController($app);
    return $controller->deleteFixedBill();

});

$app->post('/getUnits/updateFinance/?', function () use ($app) {
    $controller = new UF\UnitspaymentsController($app);
    return $controller->updateFinance();

});

//users Controller
$app->get('/users/?', function () use ($app) {
    $controller = new UF\UserController($app);
    return $controller->pageUsers();
})->name('uri_users');

//get Logged UserId
$app->get('/users/getUserId/?', function () use ($app) {
    // Access-controlled page

    $controller = new UF\UserController($app);
    return $controller->getUserId();

});

// List users
$app->get('/users/?', function () use ($app) {
    $controller = new UF\UserController($app);
    return $controller->pageUsers();
})->name('uri_users');

// List users in a particular primary group
$app->get('/users/:primary_group/?', function ($primary_group) use ($app) {
    $controller = new UF\UserController($app);
    return $controller->pageUsers($primary_group);
});

// User info form (update)
$app->get('/forms/users/u/:user_id/?', function ($user_id) use ($app) {
    $controller = new UF\UserController($app);
    return $controller->formUserEdit($user_id);
});

// User edit password form
$app->get('/forms/users/u/:user_id/password/?', function ($user_id) use ($app) {
    $controller = new UF\UserController($app);
    $get        = $app->request->get();
    return $controller->formUserEditPassword($user_id);
});

// User creation form
$app->get('/forms/users/?', function () use ($app) {
    $controller = new UF\UserController($app);
    return $controller->formUserCreate();
});

// User info page
$app->get('/users/u/:user_id/?', function ($user_id) use ($app) {
    $controller = new UF\UserController($app);
    return $controller->pageUser($user_id);
});

// Create user
$app->post('/users/?', function () use ($app) {
    $controller = new UF\UserController($app);
    return $controller->createUser();

});

// Update user info
$app->post('/users/u/:user_id/?', function ($user_id) use ($app) {
    $controller = new UF\UserController($app);
    return $controller->updateUser($user_id);
});

// Delete user
$app->post('/users/u/:user_id/delete/?', function ($user_id) use ($app) {
    $controller = new UF\UserController($app);
    return $controller->deleteUser($user_id);
});

/********** GROUP MANAGEMENT INTERFACE **********/

// List groups
// $app->get('/groups/?', function () use ($app) {
//     $controller = new UF\GroupController($app);
//     return $controller->pageGroups();
// });

// List auth rules for a group
$app->get('/groups/g/:group_id/auth?', function ($group_id) use ($app) {
    $controller = new UF\GroupController($app);
    return $controller->pageGroupAuthorization($group_id);
})->name('uri_authorization');

// Group info form (update)
$app->get('/forms/groups/g/:group_id/?', function ($group_id) use ($app) {
    $controller = new UF\GroupController($app);
    return $controller->formGroupEdit($group_id);
});

// Group creation form
$app->get('/forms/groups/?', function () use ($app) {
    $controller = new UF\GroupController($app);
    return $controller->formGroupCreate();
});

// Create group
$app->post('/groups/?', function () use ($app) {
    $controller = new UF\GroupController($app);
    return $controller->createGroup();
});

// Update group info
$app->post('/groups/g/:group_id/?', function ($group_id) use ($app) {
    $controller = new UF\GroupController($app);
    return $controller->updateGroup($group_id);
});

// Delete group
$app->post('/groups/g/:group_id/delete/?', function ($group_id) use ($app) {
    $controller = new UF\GroupController($app);
    return $controller->deleteGroup($group_id);
});

/********** GROUP AUTH RULES INTERFACE **********/

// Group auth creation form
$app->get('/forms/groups/g/:group_id/auth/?', function ($group_id) use ($app) {
    $controller = new UF\AuthController($app);
    return $controller->formAuthCreate($group_id, "group");
});

// Group auth update form
$app->get('/forms/groups/auth/a/:rule_id/?', function ($rule_id) use ($app) {
    $controller = new UF\AuthController($app);
    $get        = $app->request->get();
    return $controller->formAuthEdit($rule_id);
});

// Group auth create
$app->post('/groups/g/:group_id/auth/?', function ($group_id) use ($app) {
    $controller = new UF\AuthController($app);
    return $controller->createAuthRule($group_id, "group");
});

// Group auth update
$app->post('/groups/auth/a/:rule_id?', function ($rule_id) use ($app) {
    $controller = new UF\AuthController($app);
    return $controller->updateAuthRule($rule_id, "group");
});

// Group auth delete
$app->post('/auth/a/:rule_id/delete/?', function ($rule_id) use ($app) {
    $controller = new UF\AuthController($app);
    $get        = $app->request->get();
    return $controller->deleteAuthRule($rule_id);
});

/************ ADMIN TOOLS *************/

// $app->get('/config/settings/?', function () use ($app) {
//     $controller = new UF\AdminController($app);
//     return $controller->pageSiteSettings();
// })->name('uri_settings');

// $app->post('/config/settings/?', function () use ($app) {
//     $controller = new UF\AdminController($app);
//     return $controller->siteSettings();
// });

$app->get('/config/mail_config/?', function () use ($app) {
    $controller = new UF\AdminController($app);
    return $controller->pageEmailSettings();
})->name('uri_mail_config');

$app->post('/config/mail_config/?', function () use ($app) {
    $controller = new UF\AdminController($app);
    return $controller->emailSetting();
});

// Build the minified, concatenated CSS and JS
$app->get('/config/build', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_minify')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }

    $app->schema->build(true);
    $app->alerts->addMessageTranslated("success", "MINIFICATION_SUCCESS");
    $app->redirect($app->urlFor('uri_settings'));
});

// Slim info page
$app->get('/sliminfo/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_slim_info')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    echo "<pre>";
    print_r($app->environment());
    echo "</pre>";
});

// PHP info page
$app->get('/phpinfo/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_php_info')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    echo "<pre>";
    print_r(phpinfo());
    echo "</pre>";
});

// Error log page
$app->get('/errorlog/?', function () use ($app) {
    // Access-controlled page
    if (!$app->user->checkAccess('uri_error_log')) {
        $app->redirect('{{site.uri.public}}/rawabi_unit_reservation/public/');
    }
    $log = UF\SiteSettings::getLog();
    echo "<pre>";
    echo implode("<br>", $log['messages']);
    echo "</pre>";
});

/************ INSTALLER *************/

$app->get('/install/?', function () use ($app) {
    $controller = new UF\InstallController($app);
    if (isset($app->site->install_status)) {
        // If tables have been created, move on to master account setup
        if ($app->site->install_status == "pending") {
            $app->redirect($app->site->uri['public'] . "/install/master");
        } else {
            // Everything is set up, so go to the home page!
            $app->redirect($app->urlFor('uri_home'));
        }
    } else {
        return $controller->pageSetupDB();
    }
})->name('uri_install');

$app->get('/install/master/?', function () use ($app) {
    $controller = new UF\InstallController($app);
    if (isset($app->site->install_status) && ($app->site->install_status == "pending")) {
        return $controller->pageSetupMasterAccount();
    } else {
        $app->redirect($app->urlFor('uri_install'));
    }
});

$app->post('/install/:action/?', function ($action) use ($app) {
    $controller = new UF\InstallController($app);
    switch ($action) {
        case "master":return $controller->setupMasterAccount();
        default:$app->notFound();
    }
});

/************ API *************/

$app->get('/api/users/?', function () use ($app) {
    $controller = new UF\ApiController($app);
    $controller->listUsers();
});

/************ MISCELLANEOUS UTILITY ROUTES *************/

// Generic confirmation dialog
$app->get('/forms/confirm/?', function () use ($app) {
    $get = $app->request->get();

    // Load the request schema
    $requestSchema = new \Fortress\RequestSchema($app->config('schema.path') . "/forms/confirm-modal.json");

    // Get the alert message stream
    $ms = $app->alerts;

    // Remove csrf_token
    unset($get['csrf_token']);

    // Set up Fortress to process the request
    $rf = new \Fortress\HTTPRequestFortress($ms, $requestSchema, $get);

    // Sanitize
    $rf->sanitize();

    // Validate, and halt on validation errors.
    if (!$rf->validate()) {
        $app->halt(400);
    }

    $data = $rf->data();

    $app->render('components/common/confirm-modal.twig', $data);
});

$app->get('/forms/confirm/:user_id/?', function ($user_id) use ($app) {
    $controller = new UF\UserController($app);
    return $controller->formActivateUser($user_id);
});


// Alert stream
$app->get('/alerts/?', function () use ($app) {
    $controller = new UF\BaseController($app);
    $controller->alerts();
});

// JS Config
$app->get($app->config('uri')['js-relative'] . '/config.js', function () use ($app) {
    $controller = new UF\BaseController($app);
    $controller->configJS();
});

// Theme CSS
$app->get($app->config('uri')['css-relative'] . '/theme.css', function () use ($app) {
    $controller = new UF\BaseController($app);
    $controller->themeCSS();
});

// Not found page (404)
$app->notFound(function () use ($app) {
    if ($app->request->isGet()) {
        $controller = new UF\BaseController($app);
        $controller->page404();
    } else {
        $app->alerts->addMessageTranslated("danger", "SERVER_ERROR");
    }
});

$app->run();
