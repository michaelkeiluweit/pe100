<?php
// <FILEHEADERTAG>

require_once( "oxconfig.php");
require_once( "baseview.php");

class oxUBase extends oxBaseView
{
    // fuer User defined aenderungen in der Basisklasse
	var $aUserComponents = array(
                                    //"modules/cmp_nfq"
                                  );
    function init()
    {   
    	if( !$this->blCommonAdded)
        {   // as the objects are cached by dispatcher we have to watch out, that we don't add
            // these components twice
            $this->aComponentNames = array_merge( $this->aComponentNames, $this->aUserComponents);
        }

        parent::init();
    }    
    
}

?>
