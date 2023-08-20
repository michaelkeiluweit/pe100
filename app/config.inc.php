<?  /** @name database information */
    $this->dbHost         = "db";            // database host name
    $this->dbName         = "oxid";            		// database name
    $this->dbUser         = "oxid";                    	// database user name
    $this->dbPwd          = "oxid";                   	// database user password
    $this->dbType         = 'mysql';

    $this->sShopURL       = "http://localhost/";
    $this->sSSLShopURL    = "http://localhost/";
    $this->sShopDir       = "/var/www/html/";
    $this->sCompileDir    = "/var/www/html/tmp";

    // database caching, enable for huge article amounts
    $this->blDBCaching    = false;
    
    // demomode - disable if you use this shop
    $this->blDemoMode	  = true;
    
    // list all spiders here, so that oxid does not add SID if they index shop
	$this->aRobots  	  = array("googlebot","ultraseek","crawl","robot","spider"); 
	
	// change this, if you want to enter netprices in admin
	$this->blEnterNetPrice = false;
	
	// validate users eMail Adresses
	$this->iValidateEMail  = 1;    // 1 = only syntax checking
	                               // 2 = online full check
	                               // 0 = off

    // if validate eMailadress == 2 then you need to set Nameservers here
    $this->aNameServers     = array( "localhost" );
	
	// change this to true if you want to calculate always delivery costs
	$this->blCalculateDelCostIfNotLoggedIn   = false;

    //  enable debug mode for template development or bugfixing
    //  0 = off
    //  1 = smarty
    //  2 = SQL
    //  3 = SQL + smarty
    //  4 = SQL + smarty + shoptemplate data
    //  5 = Delivery Cost calculation info
    //	6 = SMTP Debug Messages
    $this->iDebug         = 0;

    $this->aModules       = array(
    								//"contact" => "mycontact"
                                );

    $this->sChannel       = "html";

    // default VAT, used when you don't set any VAT in Admin
    $this->dDefaultVAT    = 16;

    // Nr. of Articles displayed when opening a category
    $this->iNrofCatArticles     = 10;
    // Nr. of Articles displayed when searching
    $this->iNrofSearchArticles  = 10;
    $this->iNrofSearchPages		= 10;
    // Nr. of Similar Articles displayed
    $this->iNrofSimilarArticles	= 5;
    // Nr. of CustomerWhoboughthis... Articles
    $this->iNrofCustomerWhoArticles	= 5;
    // Nr. of Crosselling Articles
    $this->iNrofCrossellArticles	= 5;

    // add or remove possible languages here
    $this->aLanguages     = array (
                                0 => "DE",
                                1 => "EN",
                                2 => "FR",
                                3 => "SP"
                                );
    $this->sDefaultLang   = 0;

    // add or remove possible currencies here
    $this->aCurrencies    = array (
                                 0 => "EUR@ 1.00@ ,@ .@ &euro;",
                                 1 => "GPB@ 0.68@ .@  @ &pound;",
                                 2 => "CHF@ 1.47@ ,@ .@ CHF"
                                );
    // Default currency is always index 0
    
    // home country, user from other countries will be added to group foreigners
    $this->aHomeCountry   = array (
                                 "deutschland",
                                 "deutsch",
                                 "germany",
                                 "de"
                                  );
    
    // Date Output Format
    $this->sDateFormat =        "d.m.Y";
    
    // Thumbnail and Picture Size
    $this->iUseGDVersion          = 2;
    $this->sThumbnailsize         = "100*100";
    $this->sCatThumbnailsize      = "100*100";
    $this->aPicSizes              = array (
                                  "150*150",    // Picture 1
                                  "400*400",    // Picture 2
                                  "200*200",    // Picture 3
                                  "200*200",    // Picture 4
                                  "300*300"     // Picture 5
                                  );
	
    // Import / Export
	$this->sCSVSign					= "~";
	
	$this->iExportNrofLines			= 50;
	$this->iExportTickerRefresh		= 3;

	$this->iImportNrofLines			= 50;
	$this->iImportTickerRefresh		= 3;
	
	// Catalog mode
	$this->blCatalogue				= false;
	
	// lexware faktura VAT settings
    $this->aLexwareVAT              = array (
                                  1 => 15,
                                  2 => 7,
                                  3 => 16,
                                  4 => 20,
                                  5 => 10
                                  );	
	
?>
