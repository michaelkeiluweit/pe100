<?php
// // oxid eSales © NFQ GmbH 2003
//
// Diese Software ist urheberrechtlich geschuetzt - sie ist
// KEINE Freeware.
//
// Die unerlaubte Verwendung dieser Software ohne gueltigen 
// Lizenzschluessel ist ein ein Verstoss gegen die Lizenz-
// bedingungen und wird straf- bzw. auch zivilrechtlich verfolgt.
//
// http://www.nfq-esales.de


require_once( "ubase.php");

class Newsletter extends oxUBase
{
    function render()
    {   global $myConfig;
    
        parent::render();

        // topoffer
        $oArtList = &oxNew( "oxarticlelist", "core");
        $oArtList->LoadAktionArticles( "OXTOPSTART");
        $oTopOffer = @current( $oArtList->aList);
        if( isset( $oTopOffer))
            $this->aViewData['toparticle'] = $oTopOffer;
            
        return "newsletter.tpl";
    }
    
    function send()
    {   global $myConfig;
    
        $aParams    = $myConfig->getParameter("editval");
        
        if( !$aParams['oxuser__oxfname'] || !$aParams['oxuser__oxlname'] || !$aParams['oxuser__oxusername'] || !$aParams['oxuser__oxpassword'])
        {   $this->aViewData['error'] = 1;
            return;
        }
        
        $oUser = &oxNew( "oxuser", "core");
        $oUser->oxuser__oxusername->value = $aParams['oxuser__oxusername'];
        $oUser->oxuser__oxpassword->value = $aParams['oxuser__oxpassword'];
        $oUser->oxuser__oxactiv->value    = 1;
        $oUser->oxuser__oxrights->value   = "user";
        $oUser->oxuser__oxfname->value    = $aParams['oxuser__oxfname'];
        $oUser->oxuser__oxlname->value    = $aParams['oxuser__oxlname'];
        $oUser->oxuser__oxsal->value      = $aParams['oxuser__oxsal'];
        $oUser->oxuser__oxdboptin->value  = 0;
        if( !$oUser->insert())   // if username does exist already it won't save as this is unique
        {   $this->aViewData['error'] = 2;
            return;
        }

        // send dboptin mail
        $oxEMail = &oxNew( "oxemail", "core");
        if( $oxEMail->SendNewsletterDBOptInMail( $oUser, $this))
            $this->aViewData['success'] = 1;
    }
    
    function addme()
    {   global $myConfig;
    
        $sID = $myConfig->getParameter("uid");
        $oUser = &oxNew( "oxuser", "core");
        $oUser->Load( $sID);
        $oUser->oxuser__oxdboptin->value  = 1;
        $oUser->Save();
        
        // add to group newsletter
        $oNewGroup = &oxNew( "oxbase", "core");
        $oNewGroup->Init( array( "oxobject2group"));
        $oNewGroup->oxobject2group__oxobjectid->value = $sID;
        $oNewGroup->oxobject2group__oxgroupsid->value = "oxidnewsletter";
        $oNewGroup->Save();
        
        $this->aViewData['success'] = 2;
    }

    function removeme()
    {   global $myConfig;

        $sID = $myConfig->getParameter("uid");
        $oUser = &oxNew( "oxuser", "core");
        $oUser->Load( $sID);
        $oUser->oxuser__oxdboptin->value  = 0;
        $oUser->Save();

        $this->aViewData['success'] = 3;
    }

}

?>
