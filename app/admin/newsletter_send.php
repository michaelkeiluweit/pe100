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

class Newsletter_send extends oxAdminView
{
	var $iCntofMails	= 8;
	
    function render()
    {   global $myConfig;
    	global $mySession;
    
        parent::render();

	    $iStart = $myConfig->getParameter( "iStart");
	    $iUser  = $myConfig->getParameter( "user");
	    $sID  	= $myConfig->getParameter( "id");
	    
        $oNewsletter = &oxNew( "oxnewsletter", "core");
        $oNewsletter->Load( $sID);
	    
	    // send emails....
	    $oDB = GetDB();
    	$sSelect =  "select oxuser.oxid, oxuser.oxusername from oxuser left join oxobject2group on oxobject2group.OXOBJECTID = oxuser.oxid where oxobject2group.oxgroupsid in ( ";
    	$blSep = false;
        foreach( $oNewsletter->oGroups->aList as $sInGroup)
        {   $sSearchKey = $sInGroup->oxgroups__oxid->value;
        	if( $blSep)
        		$sSelect .= ",";
    		$sSelect .= "'$sSearchKey'";
    		$blSep = true;
        }
    	$sSelect .= ") and oxuser.oxactiv = 1 and oxuser.oxdboptin = 1 group by oxuser.oxid";
    	$rs = $oDB->SelectLimit( $sSelect, $this->iCntofMails, $iStart);

    	$oNewsletter->Prepare( $this);
    	if ($rs != false && $rs->RecordCount() > 0)
        {   while (!$rs->EOF)
            {   
            	$sUserID = $rs->fields[0];
            	$oNewsletter->Create( $sUserID);
				if( $oNewsletter->Send())
				{	// add user history
			        $oRemark    = &oxNew( "oxremark", "core");
			        $oRemark->oxremark__oxtext->value 		= $oNewsletter->sPlainText;
		        	$oRemark->oxremark__oxparentid->value 	= $sUserID;
		        	$oRemark->oxremark__oxtype->value		= "n";
			        $sShopID = $mySession->getVar( "actshop");
		    	    $oRemark->oxremark__oxshopid->value = $sShopID;
		        	$oRemark->Save();
				}
				else
					echo( "problem sending to : ".$rs->fields[1]."<br>");
                
   	        	$rs->MoveNext();
            }
        }
	    
        // adavance mail pointer and set parameter
    	$iStart += $this->iCntofMails;

	    $this->aViewData["iStart"] 	=  $iStart;
	    $this->aViewData["user"] 	=  $iUser;
	    $this->aViewData["id"] 		=  $sID;
	    
        
        // end ?
        if( $iStart < $iUser)
        	$sPage = "newsletter_send.tpl";
        else 
        	$sPage = "newsletter_done.tpl";

		return $sPage;
    }
}

?>
