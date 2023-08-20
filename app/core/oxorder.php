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

require_once( $myConfig->sCoreDir . "fpdf/oxpdf.php");
require_once( $myConfig->sCoreDir . "oxbase.php");

class oxOrder extends oxBase
{
    var $oArticles      = null;

    function oxOrder()
    {   parent::oxBase();

        $this->sClassName  = "oxorder";
        $this->Init( array( "oxorder"));
    }

    function Assign( $dbRecord)
    {
        parent::Assign( $dbRecord);

        // ordered articles
        $this->oArticles = &oxNew( "oxlist", "core");
        $this->oArticles->Init( "oxbase");
        $this->oArticles->oLstoTpl->Init( array( "oxorderarticles", "oxarticles"));
        $sSelect =  "select * from oxorderarticles left join oxarticles on oxorderarticles.oxartid=oxarticles.oxid ";
        $sSelect .= "where oxorderarticles.oxorderid='$this->sOXID'";
        $this->oArticles->selectString( $sSelect);

        // convert date's to international format
        $this->oxorder__oxorderdate->value      = FormatDBDate( $this->oxorder__oxorderdate->value);
    }

    function insert()
    {	global $mySession;

        // set oxinsert
        $timeout = time();
        $now = date("Y-m-d H:i:s", $timeout);
        $this->oxorder__oxorderdate->value = $now;

		$sShopID = $mySession->getVar( "actshop");
        $this->oxorder__oxshopid->value = $sShopID;

        return parent::insert();
    }

    function update()
    {
        // dont change this field
        $iPos = array_search( "oxorder__oxorderdate", $this->aIdx2FldName);
        unset( $this->aIdx2FldName[$iPos]);

        parent::update();
    }

    function delete( $sOXID = null)
    {
        if( !$sOXID)
            $sOXID = $this->sOXID;
        if( !$sOXID)
            return false;

        parent::delete( $sOXID);

        $oDB = GetDB();

        $sDelete = "delete from oxorderarticles where oxorderarticles.oxorderid = '$sOXID'";
        $rs = $oDB->Execute( $sDelete);

        return $rs->EOF;
    }

    function pdffooter(&$pdf)
    {   global $myConfig;
        global $mySession;

        $sShopID = $mySession->getVar( "actshop");
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $sShopID);

        $pdf->Line(15, 272, 195, 272);
        // Block 1
        $pdf->SetFont('Arial','',7);
        $pdf->Text(15,275,$oShop->oxshops__oxcompany->value);
        $pdf->Text(15,278,$oShop->oxshops__oxfname->value." ".$oShop->oxshops__oxlname->value);
        $pdf->Text(15,281,$oShop->oxshops__oxstreet->value);
        $pdf->Text(15,284,$oShop->oxshops__oxzip->value." ".$oShop->oxshops__oxcity->value);
        $pdf->Text(15,287,$oShop->oxshops__oxcountry->value);
        // Block 2
        $pdf->Text(85,275,$oShop->oxshops__oxtelefon->value);
        $pdf->Text(85,278,'');
        $pdf->Text(85,281,$oShop->oxshops__oxtelefax->value);
        $pdf->Text(85,284,$oShop->oxshops__oxurl->value);
        $pdf->Text(85,277,$oShop->oxshops__oxorderemail->value);
        // Block 3
        $pdf->Text(150,275,$oShop->oxshops__oxvatnumber->value);
        $pdf->Text(150,278,'');
        $pdf->Text(150,281,$oShop->oxshops__oxbankname->value);
        $pdf->Text(150,284,$oShop->oxshops__oxbanknumber->value);
        $pdf->Text(150,287,$oShop->oxshops__oxbankcode->value);
    }

    function pdfheaderplus(&$pdf)
    {   global $myConfig;
        global $mySession;

        $pdf->AddPage();
        $sShopID = $mySession->getVar( "actshop");
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $sShopID);
        //logo
        $saImSize = @GetImageSize($myConfig->getAbsImageDir()."/pdf_logo.jpg");
        $margin   = (210-($saImSize[0]*0.2))/2;
        $pdf->SetLink($oShop->oxshops__oxurl->value);
        $pdf->Image($myConfig->getAbsImageDir()."/pdf_logo.jpg",$margin,10,$saImSize[0]*0.2,$saImSize[1]*0.2,'',$oShop->oxshops__oxurl->value);

        $pdf->SetFont('Arial','',8);
        $pdf->Text(15,50,"Menge");
        $pdf->Text(30,50,"Art.-Nr.");
        $pdf->Text(45,50,"Beschreibung");
        $pdf->Text(160,50,"Einzelpreis");
        $pdf->Text(195-$pdf->GetStringWidth("Gesamtpreis"),50,"Gesamtpreis");
        $pdf->Line(15, 52, 195, 52);
    }

    function pdfheader(&$pdf)
    {   global $myConfig;
        global $mySession;
        $pdf->AddPage();
        $sShopID = $mySession->getVar( "actshop");
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $sShopID);
        //logo
        $saImSize = @GetImageSize($myConfig->getAbsImageDir()."/pdf_logo.jpg");
        $margin   = (210-($saImSize[0]*0.2))/2;
        $pdf->SetLink($oShop->oxshops__oxurl->value);
        $pdf->Image($myConfig->getAbsImageDir()."/pdf_logo.jpg",$margin,10,$saImSize[0]*0.2,$saImSize[1]*0.2,'',$oShop->oxshops__oxurl->value);
    }

    function GenPDF( $sFilename)
    {   global $myConfig;
        global $mySession;

        $pdf=new oxPDF();
        $pdf->Open();

        $sShopID = $mySession->getVar( "actshop");
        $oShop = &oxNew( "oxshop", "core");
        $oShop->Load( $sShopID);

        $this->pdfheader($pdf);

        //briefkopf basic
        $pdf->SetFont('Arial','',6);
        $pdf->Text(15, 55,$oShop->oxshops__oxname->value." - ".$oShop->oxshops__oxstreet->value." - ".$oShop->oxshops__oxzip->value." - ".$oShop->oxshops__oxcity->value);
        $pdf->SetFont('Arial','',10);
        $pdf->Text(15, 59,$this->oxorder__oxbillsal->value);
        $pdf->Text(15, 63,$this->oxorder__oxbilllname->value ." ".$this->oxorder__oxbillfname->value);
        $pdf->Text(15, 67,$this->oxorder__oxbillcompany->value);
        $pdf->Text(15, 71,$this->oxorder__oxbillstreet->value);
        $pdf->Text(15, 75,$this->oxorder__oxbillzip->value ." ".$this->oxorder__oxbillcity->value);
        $pdf->Text(15, 79,$this->oxorder__oxbillcountry->value);
        
        // user
        $oUser = &oxNew( "oxuser", "core");
        $oUser->Load( $this->oxorder__oxuserid->value);

        //datum Rechnungsnummer Kundenummer
        $pdf->SetFont('Arial','',5);
        $pdf->Text(195-$pdf->GetStringWidth("Bei Zahlungen bitte immer angeben."),70, "Bei Zahlungen bitte immer angeben.");
        $pdf->SetFont('Arial','',7);
        //$pdf->Text(195-$pdf->GetStringWidth("Rechnungsnummer 123456"),73, "Rechnungsnummer 123456");
        $sKdnr = "Kundennummer " . $oUser->oxuser__oxcustnr->value;
        $pdf->Text(195-$pdf->GetStringWidth($sKdnr),73/*76*/, $sKdnr);
        $pdf->SetFont('Arial','',10);
        $dOrderPrintdate = date("d.m.Y");
        $pdf->Text(195-$pdf->GetStringWidth($this->oxorder__oxbillcity->value.", ".$dOrderPrintdate), 95,$this->oxorder__oxbillcity->value.", ".$dOrderPrintdate);

        // betreff
        $pdf->SetFont('Arial','',12);
        $pdf->Text(15, 100,"Bestellnr. ".$this->oxorder__oxordernr->value);
        $pdf->SetFont('Arial','',10);
        $dOrderDate  =  mktime(0,0,0,substr($this->oxorder__oxorderdate->value,4,2),substr($this->oxorder__oxorderdate->value,6,2),substr($this->oxorder__oxorderdate->value,0,4));
        $sOrderDate  = date( "d.m.Y", $dOrderDate);
        $pdf->Text(15,111,"Ihre Bestelllung vom $sOrderDate bei ".$oShop->oxshops__oxurl->value);

        //articleheader
        $pdf->SetFont('Arial','',8);
        $pdf->Text(15,115,"Menge");
        $pdf->Text(30,115,"Art.-Nr.");
        $pdf->Text(45,115,"Beschreibung");
        $pdf->Text(160,115,"Einzelpreis");
        $pdf->Text(195-$pdf->GetStringWidth("Gesamtpreis"),115,"Gesamtpreis");
        $pdf->Line(15, 117, 195, 117);

        $pdf->SetFont('Arial','',10);
        // Währung
    	$oCur = $myConfig->getActShopCurrencyObject();

        // Artikel
        $dNetSum 	= 0;
        $dBrutSum	= 0;
        $dTax       = 0;
        $siteH = 117;
        while (list($key, $oOrderArt) = each( $this->oArticles->aList))
        {
            if($siteH > 243)
            {  $this->pdffooter($pdf);
               $this->pdfheaderplus($pdf);
               $siteH = 80;
            }
            else
            $siteH=$siteH+4;
            
            $dNetSum 	+= $oOrderArt->oxorderarticles__oxnetprice->value * $oOrderArt->oxorderarticles__oxamount->value;
        	$dBrutSum	+= $oOrderArt->oxorderarticles__oxbrutprice->value* $oOrderArt->oxorderarticles__oxamount->value;
            $dTax       += $oOrderArt->oxorderarticles__oxbrutprice->value - $oOrderArt->oxorderarticles__oxnetprice->value;
        	$oOrderArt->fnetprice 		= FormatCurrency( $oOrderArt->oxorderarticles__oxnetprice->value, $oCur);
          	$oOrderArt->fbrutprice 		= FormatCurrency( $oOrderArt->oxorderarticles__oxbrutprice->value, $oCur);
            $dBrutArtSum               	= FormatCurrency( $oOrderArt->oxorderarticles__oxbrutprice->value * $oOrderArt->oxorderarticles__oxamount->value, $oCur);
            //menge
            $pdf->Text(20-$pdf->GetStringWidth($oOrderArt->oxorderarticles__oxamount->value),$siteH,$oOrderArt->oxorderarticles__oxamount->value);
             // artikel einzelpreis
            $pdf->Text(174-$pdf->GetStringWidth($oOrderArt->fbrutprice." €"),$siteH,$oOrderArt->fbrutprice." €");
            // gesamtartikelpreis
            $pdf->Text(195-$pdf->GetStringWidth($dBrutArtSum." €"),$siteH,$dBrutArtSum." €");
            // beschreibung
            $pdf->Text(45,$siteH,substr($oOrderArt->oxorderarticles__oxtitle->value,0,58));
            // artikelnummer
            $pdf->SetFont('Arial','',8);
            $pdf->Text(28,$siteH,$oOrderArt->oxorderarticles__oxartnum->value);
            $pdf->SetFont('Arial','',10);
            
            $oOrderArt->fbrutprice 		= FormatCurrency( $oOrderArt->oxorderarticles__oxbrutprice->value, $oCur);
        	$oOrderArt->ftotbrutprice	= FormatCurrency( $oOrderArt->oxorderarticles__oxbrutprice->value * $oOrderArt->oxorderarticles__oxamount->value, $oCur);
        	$this->oArticles->aList[$key] = $oOrderArt;
            // Varianten
            if(strlen ($oOrderArt->oxorderarticles__oxselvariant->value) != 0 )
            {
                $siteH = $siteH + 4;
                $pdf->Text(45,$siteH,substr($oOrderArt->oxorderarticles__oxselvariant->value,0,58));
            }
        }
        $this->totalnetsum 	    = FormatCurrency( $dNetSum, $oCur);
        $this->totalbrutsum 	= FormatCurrency( $dBrutSum, $oCur);
            if($siteH > 230)
            {  $this->pdffooter($pdf);
               $this->pdfheader($pdf);
               $siteH = 80;
            }
        //gesamtbetrag artikel
        $pdf->Line(15, $siteH+1, 195, $siteH+1);
        $pdf->Text(45,$siteH+4,"Gesamtbetrag Artikel");
        $pdf->Text(195-$pdf->GetStringWidth($this->totalbrutsum." €"),$siteH+4,$this->totalbrutsum." €");

        // versandkosten
        $this->totalbrutsum += $this->oxorder__oxdelcost->value;
        $sDelCost = FormatCurrency( $this->oxorder__oxdelcost->value, $oCur);
        $pdf->Text(45,$siteH+8,"Versandkosten");
        $pdf->Text(195-$pdf->GetStringWidth($sDelCost." €"),$siteH+8,$sDelCost." €");

        // Versandgebühren
        $this->totalbrutsum += $this->oxorder__oxpaycost->value;
        $sDelCost2 = FormatCurrency( $this->oxorder__oxpaycost->value, $oCur);
        $pdf->Text(45,$siteH+12,"Gebühren Zahlungsart");
        $pdf->Text(195-$pdf->GetStringWidth($sDelCost2." €"),$siteH+12,$sDelCost2." €");
        $pdf->Line(15, $siteH+14, 195, $siteH+14);

        // Gesamtbetrag
        $totalbrutsum = FormatCurrency( $this->totalbrutsum, $oCur);
        $pdf->SetFont('Arial','B',10);
        $pdf->Text(45,$siteH+19,"Rechnungsbetrag");
        $pdf->Text(195-$pdf->GetStringWidth($totalbrutsum." €"),$siteH+19,$totalbrutsum." €");
        $pdf->Line(15, $siteH+21, 195, $siteH+21);

        // Abschluß
        $this->totalnetsum = $dNetSum + $this->oxorder__oxdelcost->value / ( 1 + ((1/100)*$myConfig->dDefaultVAT)) + $this->oxorder__oxpaycost->value / ( 1 + ((1/100)*$myConfig->dDefaultVAT));
        $mwst = $this->totalbrutsum - $this->totalnetsum;
        $this->totalnetsum = FormatCurrency( $this->totalnetsum, $oCur);
        $mwst = FormatCurrency($mwst, $oCur);
        
        $pdf->SetFont('Arial','',10);
        
        $text = "Der Gesamtbetrag setzt sich aus Netto ".$this->totalnetsum." €, zuzüglich MwSt. ".$mwst." € zusammen.";
        $pdf->Text(15,$siteH+30,$text);

        // payment
        $oPayment = &oxNew( "oxpayment", "core");
        $oPayment->Load( $this->oxorder__oxpaymentid->value);

        $text = "Ihre gewählte Zahlungsweise : ".$oPayment->oxpayments__oxdesc->value;
        $pdf->Text(15,$siteH+34,$text);
        $this->pdffooter($pdf);

        $pdf->Output( $sFilename, true);
    }

}

?>
