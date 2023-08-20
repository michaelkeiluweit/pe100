<?php
// <FILEHEADERTAG>

require_once( "contact.php");

class myContact extends Contact
{

	function render()
	{   
	    $this->aViewData['volker'] = "mein text";
	
	        
	    return parent::render();
	}
    	
    
}