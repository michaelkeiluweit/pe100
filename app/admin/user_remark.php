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

require_once( "../oxconfig.php");
$myConfig->blAdmin = true;
require( "inc/auth.inc.php");
require_once( "oxadminview.php");

class User_remark extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();
        
        $soxId      = $myConfig->getParameter( "oxid");
        $sRemoxId   = $myConfig->getParameter( "rem_oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oUser = &oxNew( "oxuser", "core");
            $oUser->Load( $soxId);
            $this->aViewData["edit"] =  $oUser;
            
            // all remark
            $oRems = &oxNew( "oxlist", "core");
            $oRems->Init( "oxremark");
            $oRems->select( array( "oxremark.oxparentid" => $oUser->oxuser__oxid->value), array( "oxremark.oxcreate"), true);
            while (list($key, $val) = each($oRems->aList))
            {   if( $val->oxremark__oxid->value == $sRemoxId)
                {   $val->selected = 1;
                    $oRems->aList[$key] = $val;
                    break;
                }
            }
            
            $this->aViewData["allremark"] = $oRems->aList;
            
            if( isset( $sRemoxId))
            {   $oRemark = &oxNew( "oxRemark", "core");
                $oRemark->Load( $sRemoxId);
                $this->aViewData["remarktext"] 		= $oRemark->oxremark__oxtext->value;
                $this->aViewData["remarkheader"] 	= $oRemark->oxremark__oxheader->value;
            }

        }
        
        return "user_remark.tpl";
    }
    
    function save()
    {   global $myConfig;
        global $mySession;

        $soxId      = $myConfig->getParameter( "oxid");
        $sRemoxId   = $myConfig->getParameter( "rem_oxid");
      
        
        $oRemark    = &oxNew( "oxremark", "core");
        $oRemark->Load( $sRemoxId);
        
        $sNewText   = $myConfig->getParameter( "remarktext");
        $sNewHeader = $myConfig->getParameter( "remarkheader");
        $oRemark->oxremark__oxtext->value 		= $sNewText;
        $oRemark->oxremark__oxheader->value 	= $sNewHeader;
        $oRemark->oxremark__oxparentid->value 	= $soxId;
        $oRemark->oxremark__oxtype->value		= "r";
        
        // shopid
        $sShopID = $mySession->getVar( "actshop");
        $oRemark->oxremark__oxshopid->value = $sShopID;
        

        $oRemark->Save();
    }

    function delete()
    {   global $myConfig;
        global $mySession;

        $sRemoxId   = $myConfig->getParameter( "rem_oxid");
        $oRemark    = &oxNew( "oxRemark", "core");
        $oRemark->Load( $sRemoxId);
        $oRemark->delete();
    }

}

?>
