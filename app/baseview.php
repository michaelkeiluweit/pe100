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


require_once( "oxview.php");

class oxBaseView extends oxView
{
    var $blCommonAdded = false;

    var $aCommonComponents = array(
                                    "oxcmp_lang",       // must be the first entry here
                                    "oxcmp_basket",
                                    "oxcmp_cur",
                                    "oxcmp_categories",
                                    "oxcmp_shop",
                                    "oxcmp_user",
                                    "oxcmp_utils"
                                    
                                  );
    function init()
    {   
        if( !$this->blCommonAdded)
        {   // as the objects are cached by dispatcher we have to watch out, that we don't add
            // these components twice
            $this->aComponentNames = array_merge( $this->aComponentNames, $this->aCommonComponents);
            $this->blCommonAdded = true;
        }
        
        parent::init();
    }
    
    function start()
    {
        parent::start();
    }

    function render()
    {   

        parent::render();
    }
    
}

?>
