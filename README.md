
## About

This projects target is to revive the very first stable version of the OXID eShop.

To achieve that, the source code had to be edited on some parts to get most of the shop working.  

Since the library mysql_* isn't available, but was replaced by the library mysqli_, a 
compatibility layer was created to define the methods mysql_* with mysqli* under the hood.
See `app/_compatible_layer_patch.php` for further information.  

Some changes had to be done direcly in the code. Those changes are marked with the comment
``// MK``.

### Specials
- The setup wizard didn't overwrite the file config.inc.php. You had to.  
  Remember the old game Larry where you actually had to give correct answers to its questions before it allowed you to play it? Pepperidge Farm Remembers.
- The library adodb was used, later it was replaced by the adodblite to save 500 kb!
- The version 2.5.0 of Smarty was used. The OXID eShop 6.5.3 uses Smarty 2.6.33. Let's talk stable technology! 

### Screenshots 
The shop itself is preinstalled. See the screenshots for an impression how the setup wizard has looked like.
![Setup wizard. Step 0.](assets/setup_0.png?raw=true "Setup wizard. Step 0.")
![Setup wizard. Step 1.](assets/setup_1.png?raw=true "Setup wizard. Step 1.")
![Setup wizard. Step 2.](assets/setup_2.png?raw=true "Setup wizard. Step 2.")
![Setup wizard. Step 3.](assets/setup_3.png?raw=true "Setup wizard. Step 3.")
Shop is not working? It can't connect to the database? Let's see again setup step 3.
![Setup wizard. Step 3.1.](assets/setup_31.png?raw=true "Setup wizard. Step 3.1.")
Wait, there is more on this page!
## Install
```bash
docker build --tag=pe100php .
docker-compose up -d
```
The shop is now callable by `http://localhost/`

Please note: Currently no mail server is installed. Doing a checkout leads to a SMTP error.

## Credentials
Since the demo mode is active by default (see `config.inc.php::$blDemoMode`), the admin credentials are:
```
username: admin
password: admin
```


## Debug
This image comes with a working Xdebug installation. Configure your IDE like the following examples.

### Webserver
![Debug webserver.](assets/debug_webserver.png?raw=true "Debug webserver.")

### Shell
![Debug shell.](assets/debug_shell.png?raw=true "Debug shell.")



## Troubeshooting

### Error connecting to database, check settings in config.inc.php !
```
docker-compose down
rm mysql/mysql.sock
docker-compose up -d
```

### Whitescreen
That screams for a missing mysql_ function. The error occours mostly in `app/core/adodb/drivers/adodb-mysql.inc.php`. For some reason no error will be displayed, but a white page.  
If the error occours because a shop class calls an undefined mysql function, then you get a clear error message on the display.
