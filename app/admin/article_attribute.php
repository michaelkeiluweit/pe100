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

class Article_attribute extends oxAdminView
{
    function render()
    {   global $myConfig;

        parent::render();
        
        // all attributes
        $oAllAttr = &oxNew( "oxlist", "core");
        $oAllAttr->Init( "oxattribute");
        $oAllAttr->select( null, array( "oxattribute.oxtitle"));

        // all selectlists
        $oAllSel = &oxNew( "oxlist", "core");
        $oAllSel->Init( "oxselectlist");
        $oAllSel->select( null, array( "oxselectlist.oxtitle"));

        $soxId = $myConfig->getParameter( "oxid");
        if( $soxId != "-1" && isset( $soxId))
        {   // load object
            $oArticle = &oxNew( "oxarticle", "core");
            $oArticle->Load( $soxId);
            $this->aViewData["edit"] =  $oArticle;

            // variant handling
            if( $oArticle->oxarticles__oxparentid->value)
            {   $oParentArticle = &oxNew( "oxarticle", "core");
                $oParentArticle->NLoad( $oArticle->oxarticles__oxparentid->value);
                $this->aViewData["parentarticle"] =  $oParentArticle;
                $this->aViewData["oxparentid"] =  $oArticle->oxarticles__oxparentid->value;
            }

            // all attributes this article has
            $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2attribute", "oxattribute"));
            $sSelect =  "select * from oxobject2attribute left join oxattribute on oxattribute.oxid=oxobject2attribute.oxattrid ";
            $sSelect .= "where oxobject2attribute.oxobjectid='".$oArticle->oxarticles__oxnid->value."' ";
            $oGroups->selectString( $sSelect);
            $this->aViewData["allartattr"] =  $oGroups->aList;
            // remove already assigned attributes from all list
            foreach( $oGroups->aList as $sInGroup)
            {   $sSearchKey = $sInGroup->oxattribute__oxid->value;
                reset( $oAllAttr->aList);
                while (list($key, $val) = each($oAllAttr->aList))
                {   if( $val->oxattribute__oxid->value == $sSearchKey)
                    {   // already in, so lets remove it
                        unset( $oAllAttr->aList[$key]);
                        break;
                    }
                }
            }

            $iLanguage = $myConfig->getParameter( "language");
            
            // all selectlists this article has
            $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2selectlist", "oxselectlist"));
            $sSelect =  "select * from oxobject2selectlist left join oxselectlist on oxselectlist.oxnid=oxobject2selectlist.oxselnid ";
            $sSelect .= "where oxobject2selectlist.oxobjectid='".$oArticle->oxarticles__oxnid->value."' and oxselectlist.oxlang = $iLanguage";
            $oGroups->selectString( $sSelect);
            $this->aViewData["allartsel"] =  $oGroups->aList;
            // remove already assigned attributes from all list
            foreach( $oGroups->aList as $sInGroup)
            {   $sSearchKey = $sInGroup->oxselectlist__oxnid->value;
                reset( $oAllSel->aList);
                while (list($key, $val) = each($oAllSel->aList))
                {   if( $val->oxselectlist__oxnid->value == $sSearchKey)
                    {   // already in, so lets remove it
                        unset( $oAllSel->aList[$key]);
                        break;
                    }
                }
            }

        }
        
        $this->aViewData["allattr"] = $oAllAttr->aList;
        $this->aViewData["allsel"] = $oAllSel->aList;

        return "article_attribute.tpl";
    }

    function addattr()
    {   global $myConfig;

        $aAddCat   = $myConfig->getParameter( "allattr");
        $soxId     = $myConfig->getParameter( "oxid");
        $oArticle = &oxNew( "oxarticle", "core");
        $oArticle->Load( $soxId);

        if( isset( $aAddCat) && $aAddCat)
        {   foreach($aAddCat as $sAdd)
            {   $oNew = &oxNew( "oxbase", "core");
                $oNew->Init( array( "oxobject2attribute"));
                $oNew->oxobject2attribute__oxobjectid->value= $oArticle->oxarticles__oxnid->value;
                $oNew->oxobject2attribute__oxattrid->value  = $sAdd;
                $oNew->Save();
            }
        }
    }
    
    function removeattr()
    {   global $myConfig;

        $aRemoveAttr= $myConfig->getParameter( "allartattr");
        $soxId      = $myConfig->getParameter( "oxid");
        $oArticle = &oxNew( "oxarticle", "core");
        $oArticle->Load( $soxId);

        if( isset( $aRemoveAttr) && $aRemoveAttr)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2attribute"));
            $sSelect =  "select * from oxobject2attribute ";
            $sSelect .= "where oxobject2attribute.oxobjectid='".$oArticle->oxarticles__oxnid->value."' and ";
            $blSep = false;
            foreach($aRemoveAttr as $sRem)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2attribute.oxattrid = '$sRem'";
                $blSep = true;
            }
            $sSelect .= ")";
            $oGroups->selectString( $sSelect);
            foreach($oGroups->aList as $sRemgroup)
                $sRemgroup->delete();
        }
    }

    function addsel()
    {   global $myConfig;

        $aAddCat   = $myConfig->getParameter( "allsel");
        $soxId     = $myConfig->getParameter( "oxid");
        $oArticle = &oxNew( "oxarticle", "core");
        $oArticle->Load( $soxId);

        if( isset( $aAddCat) && $aAddCat)
        {   foreach($aAddCat as $sAdd)
            {   $oNew = &oxNew( "oxbase", "core");
                $oNew->Init( array( "oxobject2selectlist"));
                $oNew->oxobject2selectlist__oxobjectid->value= $oArticle->oxarticles__oxnid->value;
                $oNew->oxobject2selectlist__oxselnid->value  = $sAdd;
                $oNew->Save();
            }
        }
    }

    function removesel()
    {   global $myConfig;

        $aRemoveAttr= $myConfig->getParameter( "allartsel");
        $soxId      = $myConfig->getParameter( "oxid");
        $oArticle = &oxNew( "oxarticle", "core");
        $oArticle->Load( $soxId);

        if( isset( $aRemoveAttr) && $aRemoveAttr)
        {   $oGroups = &oxNew( "oxlist", "core");
            $oGroups->Init( "oxbase");
            $oGroups->oLstoTpl->Init( array( "oxobject2selectlist"));
            $sSelect =  "select * from oxobject2selectlist ";
            $sSelect .= "where oxobject2selectlist.oxobjectid='".$oArticle->oxarticles__oxnid->value."' and ";
            $blSep = false;
            foreach($aRemoveAttr as $sRem)
            {   $sSelect .= (( $blSep) ? " or ":"(")."oxobject2selectlist.oxselnid = '$sRem'";
                $blSep = true;
            }
            $sSelect .= ")";
            $oGroups->selectString( $sSelect);
            foreach($oGroups->aList as $sRemgroup)
                $sRemgroup->delete();
        }
    }


}

?>
