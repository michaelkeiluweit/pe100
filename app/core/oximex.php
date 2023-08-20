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

require_once( $myConfig->sCoreDir . "oxbase.php");

class oxImex extends oxBase
{
	var $sMainTbl;
	var $aFields;
	
    function Init( $aTableNames)
    {   // we allow a list of tables
        if( !is_array( $aTableNames))
            $aTableNames = array( $aTableNames);

        // the first table is considered the "main" table
        if( $aTableNames[0] == "lexware")
			$this->sMainTbl = $aTableNames[0];
		else 
			parent::Init( $aTableNames);
    }
	
    function export( $iStart, $iLines, $sFilepath)
    {	global $myConfig;
    
    	if( !$this->sMainTbl)
    		return false;
    	elseif( $this->sMainTbl == "lexware")
    		return $this->exportLexwareArticles( $iStart, $iLines, $sFilepath);
    		
    	$oDB = GetDB();
    	
    	$sWhere = "";
    	
    	$sSearch = $this->sMainTbl . "__oxshopid";
        if( isset( $this->$sSearch))
        	$sWhere = " where oxshopid = '".$myConfig->getShopId()."' ";
    	
    	$sSelect = "select count(oxid) from ".$this->sMainTbl.$sWhere;
        $iSize = $oDB->GetOne( $sSelect);
        if( $iStart < $iSize)
        {  	// if first, delete the file
        	$fp = fopen( $sFilepath, "a");
        	
        	$sSelect = "select * from ".$this->sMainTbl.$sWhere;
    		$rs = $oDB->SelectLimit( $sSelect, $iLines, $iStart);
    		
	        while (!$rs->EOF)
	        {	$sLine = $this->sMainTbl;
	        
	        	foreach( $rs->fields as $field)
	        		$sLine .= $myConfig->sCSVSign.$oDB->Quote( $field, get_magic_quotes_gpc());
	        	$sLine .= "\n";
	        	
	        	fputs( $fp, $sLine);	
	        	
	            $rs->MoveNext();
	        }
	        
	        fclose( $fp);
	    	
    		return true;
        }
        
    	return false;
    }
    
    function exportLexwareArticles( $iStart, $iLines, $sFilepath)
    {	global $myConfig;
    
    	$oDB = GetDB();
    	
       	$sWhere = " where oxshopid = '".$myConfig->getShopId()."' ";
    	
    	$sSelect = "select count(oxid) from oxarticles".$sWhere;
        $iSize = $oDB->GetOne( $sSelect);
        if( $iStart < $iSize)
        {  	$fp = fopen( $sFilepath, "ab");
        	if( !$iStart)
        	{	// first time, write header
        		fwrite( $fp, "\"Artikelnummer\";\"Bezeichnung\";\"Einheit\";\"Gewicht\";\"Matchcode\";\"Preis pro Anzahl\";\"Warengruppe\";\"Warengr.-Kurzbez.\";\"Warengr.-Steuersatz\";\"Warengr.-Konto Inland\";\"Warengr.-Konto Ausland\";\"Warengr.-Konto EG\";\"Preis 1\";\"Preis 2\";\"Preis 3\";\"Preis I/1\";\"Preis I/2\";\"Preis I/3\";\"Preis II/1\";\"Preis II/2\";\"Preis II/3\";\"Preis III/1\";\"Preis III/2\";\"Preis III/3\";\"B/N\";\"Lagerartikel\";\"EK 1\";\"Währung EK1\";\"EK 2\";\"Währung EK2\";\"Staffelmenge 1\";\"Staffelmenge 2\";\"Staffelmenge 3\";\"Lieferantennummer 1\";\"Lieferantennummer 2\";\"Bestellmenge Lf.1\";\"Bestellmenge Lf.2\";\"Bestellnr. Lf.1\";\"Bestellnr. Lf.2\";\"Lieferzeit Lf.1\";\"Lieferzeit Lf.2\";\"Lagerbestand\";\"Mindestbestand\";\"Lagerort\";\"Bestellte Menge\";\"Stückliste\";\"Internet\";\"Text\"\r\n");
        	}
        	
        	$sSelect = "select * from oxarticles".$sWhere;
    		$rs = $oDB->SelectLimit( $sSelect, $iLines, $iStart);
    		
	        while (!$rs->EOF)
	        {	
    			$sToFile = "\"".$rs->fields[8]."\""           	// Artikelnummer
               .";\"".$this->InterForm($rs->fields[9])."\""		// Bezeichnung
               .";"."Stueck"                    	 // Einheit
               .";".$rs->fields[25]         	     // Gewicht
               .";\"".$rs->fields[8]."\""	       	 // Matchcode
               .";"."1,000"                      	 // Preis pro Anzahl
               .";"."\"\""                           // Warengruppe
               .";"."\"\""                           // Warengr.-Kurzbez.
               .";"."\"\"" 	                         // Warengr.-Steuersatz
               .";"."\"\""                           // Warengr.-Konto Inland
               .";"."\"\""                           // Warengr.-Konto Ausland
               .";"."\"\""                           // Warengr.-Konto EG
               .";".number_format($rs->fields[12], 2, '.', '')  // Preis 1
               .";".number_format($rs->fields[14], 2, '.', '')  // Preis 2
               .";"."\"\""  							// Preis 3
               .";"."\"\""  							// Preis I/1
               .";"."\"\""  							// Preis I/2
               .";"."\"\""                           // Preis I/3
               .";"."\"\""                           // Preis II/1
               .";"."\"\""                           // Preis II/2
               .";"."\"\""                           // Preis II/3
               .";"."\"\""                           // Preis III/1
               .";"."\"\""                           // Preis III/2
               .";"."\"\""                           // Preis III/3
               .";"."\"\""                           // B/N
               .";"."\"\""                           // Lagerartikel
               .";"."\"\""                           // EK 1
               .";"."\"\""                           // Währung EK1
               .";"."\"\""                           // EK 2
               .";"."\"\""                           // Währung EK2
               .";"."\"\""                           // Staffelmenge 1
               .";"."\"\""                           // Staffelmenge 2
               .";"."\"\""                           // Staffelmenge 3
               .";"."\"\""                           // Lieferantennummer 1
               .";"."\"\""                           // Lieferantennummer 2
               .";"."\"\""                           // Bestellmenge Lf.1
               .";"."\"\""                           // Bestellmenge Lf.2
               .";"."\"\""                           // Bestellnr. Lf.1
               .";"."\"\""                           // Bestellnr. Lf.2
               .";"."\"\""                           // Lieferzeit Lf.1
               .";"."\"\""                           // Lieferzeit Lf.2
               .";"."\"\""                           // Lagerbestand
               .";"."\"\""                           // Mindestbestand
               .";"."\"\""                           // Lagerort
               .";"."\"\""                           // Bestellte Menge
               .";"."\"\""                           // Stückliste
               .";"."1"                          // Internet
               .";\"".$this->InterForm( $rs->fields[10])."\"";  		// Text
            	$sToFile .= "\r\n";
	        	
	        	fwrite( $fp, $sToFile);	
	            $rs->MoveNext();
	        }
	        
	        fclose( $fp);
	    	
    		return true;
        }
        
    	return false;
    	
    }
    
	function InterForm( $nValue)
	{	// thnx to Volker Dörk for this function and his help here
	
		$nValue = strip_tags( $nValue);
		$nValue = str_replace( "<", "",$nValue);
		$nValue = str_replace( ";", ",",$nValue);
		$nValue = str_replace( ">", "",$nValue);
		$nValue = str_replace( "&", "und",$nValue);
		$nValue = str_replace( "ü", "ue",$nValue);
		$nValue = str_replace( "ä", "ae",$nValue);
		$nValue = str_replace( "ö", "oe",$nValue);
		$nValue = str_replace( "Ü", "Ue",$nValue);
		$nValue = str_replace( "Ä", "Ae",$nValue);
		$nValue = str_replace( "Ö", "Oe",$nValue);
		$nValue = str_replace( "\"", "'",$nValue);
	  	$nValue = str_replace( "(", "'",$nValue);
		$nValue = str_replace( ")", "'",$nValue);
	  	
		return $nValue;
	}
	
	function InternPrice( $nPrice)
    {  // thnx to Volker Dörk for this function and his help here
    
       $nPrice = number_format($nPrice,  2, '.', '');
       return $nPrice;
    }
    
    function import( $iStart, $iLines, $sFilepath)
    {	global $myConfig;
    	
    	$blContinue = true;
    
    	$fp = fopen( $sFilepath, "r");
    	$iEnd = $iStart+$iLines;
    	for( $i = 0; $i<=$iEnd; $i++)
    	{
    		$sLine = fgets( $fp, 4096);
    		if( $sLine && $i >= $iStart)
    		{	// import
    			$aData 	= explode( $myConfig->sCSVSign, $sLine);
    			// read table description if needed
    			$sTable = $aData[0];
    			if( $this->sMainTbl != $sTable)
    				$this->Init( $sTable);
    			// remove table from line
    			$aData = array_splice( $aData, 1, count($aData)-1);
    			while (list($key, $value) = each($aData))
    			{	if( $value == "''")
    					$value = null;
    				else 
    					$value = substr( $value, 1, strlen($value)-2);
    				// saomething left ?
    				if( $value == "'")
    					$value = null;
    				$aData[$key] = $value;
    			}
    			$this->Assign($aData);
    			$this->Save();
    		}
    		
    		if( feof( $fp))
    		{	$blContinue = false;
    			break;
    		}	
    	}
    	
    	fclose( $fp);
    	
    	return $blContinue;
    }
   
    function exportLexwareOrders()
    {   // thnx to Volker Dörk for this function and his help here
        global $myConfig;

        $sNewLine = "\r\n";

        $oOrderlist = &oxNew( "oxlist", "core");
        $oOrderlist->Init( "oxorder");
        $oOrderlist->select( array( "oxorder.oxexport" => 0));
        if( !count( $oOrderlist->aList))
            return;

        header("Content-type: application/xml");
        header("Content-Disposition: filename=intern.xml");
        
        $sExport  = "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>$sNewLine";
        $sExport .= "<Bestellliste>$sNewLine";
        echo( $sExport);
        
        foreach (array_keys( $oOrderlist->aList) as $key)
        {   $oOrder = & $oOrderlist->aList[$key];
        
            $oUser = &oxNew( "oxuser", "core");
            $oUser->Load( $oOrder->oxorder__oxuserid->value);
        
            $sExport  = "<Bestellung zurückgestellt=\"Nein\" bearbeitet=\"Nein\" übertragen=\"Nein\">$sNewLine";
            $sExport .= "<Standardwaehrung>978</Standardwaehrung>$sNewLine";
            $sExport .= "<Bestelldatum>$sNewLine";
            $sExport .= "<Datum>".substr($oOrder->oxorder__oxorderdate->value,0,10)."</Datum>$sNewLine";
            $sExport .= "<Zeit>".substr($oOrder->oxorder__oxorderdate->value,11,8)."</Zeit>$sNewLine";
            $sExport .= "</Bestelldatum>$sNewLine";
            $sExport .= "<Kunde>$sNewLine";

            $sExport .= "<Kundennummer>".$this->InterForm($oUser->oxuser__oxcustnr->value)."</Kundennummer>$sNewLine";
            $sExport .= "<Firmenname>".$this->InterForm($oOrder->oxorder__oxbillcompany->value)."</Firmenname>$sNewLine";
            $sExport .= "<Vorname>".$this->InterForm($oOrder->oxorder__oxbillfname->value)."</Vorname>$sNewLine";
            $sExport .= "<Name>".$this->InterForm($oOrder->oxorder__oxbilllname->value)."</Name>$sNewLine";
            $sExport .= "<Strasse>".$this->InterForm($oOrder->oxorder__oxbillstreet->value)."</Strasse>$sNewLine";
            $sExport .= "<PLZ>".$this->InterForm($oOrder->oxorder__oxbillzip->value)."</PLZ>$sNewLine";
            $sExport .= "<Ort>".$this->InterForm($oOrder->oxorder__oxbillcity->value)."</Ort>$sNewLine";
            $sExport .= "<Bundesland>".""."</Bundesland>$sNewLine";
            $sExport .= "<Land>".$this->InterForm($oOrder->oxorder__oxbillcountry->value)."</Land>$sNewLine";
            $sExport .= "<Email>".$this->InterForm($oUser->oxuser__oxusername->value)."</Email>$sNewLine";
            $sExport .= "<Telefon>".$this->InterForm($oOrder->oxorder__oxbillfon->value)."</Telefon>$sNewLine";
            $sExport .= "<Telefon2>".$this->InterForm($oUser->oxuser__oxprivfon->value)."</Telefon2>$sNewLine";
            $sExport .= "<Fax>".$this->InterForm($oOrder->oxorder__oxbillfax->value)."</Fax>$sNewLine";
            
            // lieferadresse
            if( $oOrder->oxorder__oxdellname->value)
            {   $sDelComp   = $oOrder->oxorder__oxdelcompany->value;
                $sDelfName  = $oOrder->oxorder__oxdelfname->value;
                $sDellName  = $oOrder->oxorder__oxdellname->value;
                $sDelStreet = $oOrder->oxorder__oxdelstreet->value;
                $sDelZip    = $oOrder->oxorder__oxdelzip->value;
                $sDelCity   = $oOrder->oxorder__oxdelcity->value;
                $sDelCountry= $oOrder->oxorder__oxdelcountry->value;
            }
            else
            {   $sDelComp   = "";
                $sDelfName  = "";
                $sDellName  = "";
                $sDelStreet = "";
                $sDelZip    = "";
                $sDelCity   = "";
                $sDelCountry= "";
            }

            $sExport .= "<Lieferadresse>$sNewLine";
            $sExport .= "<Firmenname>".$this->InterForm($sDelComp)."</Firmenname>$sNewLine";
            $sExport .= "<Vorname>".$this->InterForm($sDelfName)."</Vorname>$sNewLine";
            $sExport .= "<Name>".$this->InterForm($sDellName)."</Name>$sNewLine";
            $sExport .= "<Strasse>".$this->InterForm($sDelStreet)."</Strasse>$sNewLine";
            $sExport .= "<PLZ>".$this->InterForm($sDelZip)."</PLZ>$sNewLine";
            $sExport .= "<Ort>".$this->InterForm($sDelCity)."</Ort>$sNewLine";
            $sExport .= "<Bundesland>".""."</Bundesland>$sNewLine";
            $sExport .= "<Land>".$this->InterForm($sDelCountry)."</Land>$sNewLine";
            $sExport .= "</Lieferadresse>$sNewLine";
            $sExport .= "<Matchcode>".$this->InterForm($oOrder->oxorder__oxbilllname->value).", ".$this->InterForm($oOrder->oxorder__oxbillfname->value)."</Matchcode>$sNewLine";
            
            // ermitteln ob steuerbar oder nicht
            $sSteuerbar = "nein";
            
            foreach (array_keys( $oOrder->oArticles->aList) as $key)
            {   $oOrderArt = & $oOrder->oArticles->aList[$key];
                if( $oOrderArt->oxorderarticles__oxvat->value != 0)
                {   $sSteuerbar = "ja";
                    break;
                }
            }
            
            $sExport .= "<fSteuerbar>".$this->InterForm($sSteuerbar)."</fSteuerbar>$sNewLine";
            $sExport .= "</Kunde>$sNewLine";
            $sExport .= "<Artikelliste>$sNewLine";
            echo( $sExport);
            
            $dSumNetPrice = 0;
            $dSumBrutPrice = 0;
            
            foreach (array_keys( $oOrder->oArticles->aList) as $key)
            {   $oOrderArt = & $oOrder->oArticles->aList[$key];
            
                $dVATSet = array_search( $oOrderArt->oxorderarticles__oxvat->value,$myConfig->aLexwareVAT);
                $sExport  = "   <Artikel>$sNewLine";
                $sExport .= "   <Artikelzusatzinfo><Nettostaffelpreis>".$this->InternPrice( $oOrderArt->oxorderarticles__oxnetprice->value)."</Nettostaffelpreis></Artikelzusatzinfo>$sNewLine";
                $sExport .= "   <SteuersatzID>".$dVATSet."</SteuersatzID>$sNewLine";
                $sExport .= "   <Steuersatz>".$this->InternPrice($oOrderArt->oxorderarticles__oxvat->value/100)."</Steuersatz>$sNewLine";
                $sExport .= "   <Artikelnummer>".$oOrderArt->oxorderarticles__oxartnum->value."</Artikelnummer>$sNewLine";
                $sExport .= "   <Anzahl>".$oOrderArt->oxorderarticles__oxamount->value."</Anzahl>$sNewLine";
                $sExport .= "   <Produktname>".$oOrderArt->oxorderarticles__oxtitle->value;
                if( $oOrderArt->oxorderarticles__oxselvariant->value)
                    $sExport .= "/".$oOrderArt->oxorderarticles__oxselvariant->value;
                $sExport .= "   </Produktname>$sNewLine";
                $sExport .= "   <Rabatt>0.00</Rabatt>$sNewLine";
                $sExport .= "   <Preis>".$this->InternPrice($oOrderArt->oxorderarticles__oxbrutprice->value)."</Preis>$sNewLine";
                $sExport .= "   </Artikel>$sNewLine";
                echo( $sExport);
                
                $dSumNetPrice   += $oOrderArt->oxorderarticles__oxnetprice->value;
                $dSumBrutPrice  += $oOrderArt->oxorderarticles__oxbrutprice->value;
			}
			
            $sExport  = "<GesamtRabatt>0.00</GesamtRabatt>$sNewLine";
            $sExport .= "<GesamtNetto>".$this->InternPrice($dSumNetPrice)."</GesamtNetto>$sNewLine";
            $sExport .= "<Lieferkosten>".$this->InternPrice($oOrder->oxorder__oxdelcost->value)."</Lieferkosten>$sNewLine";
            $sExport .= "<Zahlungsartkosten>0.00</Zahlungsartkosten>$sNewLine";
            $sExport .= "<GesamtBrutto>".$this->InternPrice($dSumBrutPrice)."</GesamtBrutto>$sNewLine";
            
            $sPayment = $oOrder->oxorder__oxpaymentval->value;
            $sPayment = str_replace( "__", "", $sPayment);
            $sPayment = str_replace( "@@", ",", $sPayment);
            $sExport .= "<Bemerkung>".$sPayment."</Bemerkung>$sNewLine";
			echo( $sExport);
            
            $sExport  = "</Artikelliste>$sNewLine";

            $sExport .= "<Zahlung>$sNewLine";
            $oPayment = &oxNew( "oxpayment", "core");
            $oPayment->Load( $oOrder->oxorder__oxpaymentid->value);
            $sExport .= "<Art>".$oPayment->oxpayments__oxdesc->value."</Art>$sNewLine";
            $sExport .= "</Zahlung>$sNewLine";

            $sExport .= "</Bestellung>$sNewLine";
            echo( $sExport);
            
            $oOrder->oxorder__oxexport->value = 1;
            $oOrder->Save();
            
        }
        $sExport = "</Bestellliste>\r";
        echo( $sExport);
        
        exit();
    }
}

?>
