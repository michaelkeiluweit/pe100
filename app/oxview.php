<?php
// // oxid eSales � NFQ GmbH 2003
//
// Diese Software ist urheberrechtlich geschuetzt - sie ist
// KEINE Freeware.
//
// Die unerlaubte Verwendung dieser Software ohne gueltigen 
// Lizenzschluessel ist ein ein Verstoss gegen die Lizenz-
// bedingungen und wird straf- bzw. auch zivilrechtlich verfolgt.
//
// http://www.nfq-esales.de


require_once( getShopBasePath()."/oxconfig.php");

class oxView
{
    var $aComponentNames    = array();
    var $oaComponents       = array();
    var $aViewData          = array();
    var $sClassLocation     = null;
    var $oActCategory       = null;
    var $oActUser           = null;

    var $sThisAction        = null;
    
    // if this is a component we will have our parent view here
    var $oParent            = null;
    
    function oxView()
    {
    }
    
    function init()
    {   // init all components if there are any
        $this->oaComponents = array();
        foreach($this->aComponentNames as $sComponentName)
        {   $oComponent = &oxNew( $sComponentName);
            $oComponent->oParent = &$this;
            $oComponent->Init();
            $this->oaComponents[$sComponentName] = &$oComponent;
        }
        $this->AddGlobalParams();   
        
        $this->sThisAction = get_class( $this);
        
    }
    
    function start()
    {
    }

    function render()
    {   global $myConfig;

        // delete remotecat
        $myConfig->setParameter("cdefnid", null);

        foreach (array_keys( $this->oaComponents) as $key)
        {   $oComponent = & $this->oaComponents[$key];
            $this->aViewData[$oComponent->sThisAction] = $oComponent->render();
        }

        return $this->aViewData;
    }
    
    function AddGlobalParams( $shop = null)
    {   global $mySession;
        global $myConfig;
        
        $sClass = $myConfig->getParameter( "cl");
        $sCatnid= $myConfig->getParameter( "cnid");

        // MK
        if (null === $shop) {
            $shop = new stdClass();
        }

        $shop->sid              = $mySession->id;
        $shop->hiddensid        = $mySession->hiddenSession();
        $shop->selflink         = $myConfig->getShopHomeURL();
        $shop->basedir          = $myConfig->sShopURL;
        $shop->basetpldir       = $myConfig->sShopURL . $myConfig->getBaseTplDir();
        $shop->templatedir      = $myConfig->getTemplateDir();
        $shop->urltemplatedir   = $myConfig->getURLTemplateDir();
        $shop->imagedir         = $myConfig->getImageDir();
        $shop->dimagedir        = $myConfig->getDynImageDir();
        $shop->logoutlink       = $myConfig->getShopHomeURL() . "&cl=$sClass&cnid=$sCatnid&fnc=logout";
        $shop->helplink         = $myConfig->getShopHomeURL() . "&cl=help&page=$sClass";
        $shop->cnid             = $sCatnid;
        $shop->cl               = $sClass;
        $shop->basketlink       = $myConfig->getShopHomeURL() . "&cl=basket";
        $shop->orderlink        = $myConfig->getShopSecureHomeURL() . "&cl=user";
        $shop->paymentlink      = $myConfig->getShopSecureHomeURL() . "&cl=payment";
        $shop->exeorderlink     = $myConfig->getShopSecureHomeURL() . "&cl=order&fnc=execute";

        $this->aViewData["shop"] = $shop;
        
        $this->aViewData["isreview"]        = $myConfig->IsReview();
        $this->aViewData["isvarianten"]     = $myConfig->IsVarianten();
        $this->aViewData["isnewsletter"]    = $myConfig->IsNewsletter();
        $this->aViewData["catalogue"]    	= $myConfig->blCatalogue;
        
        
        return $shop;
    }
    
    function AddTplParam( $sPara, $sValue)
    {
        $this->aViewData[$sPara] = $sValue;
    }
}

?>
