
## About

This projects target is to revive the very first stable version of the OXID eShop.

To achieve that, the source code had to be edited on some parts to get most of the shop working.  

Since the library mysql_* isn't available, but was replaced by the library mysqli_, a 
compatibility layer was created to define the methods mysql_* with mysqli* under the hood.
See `app/_compatible_layer_patch.php` for further information.  

Some changes had to be done direcly in the code. Those changes are marked with the comment
``// MK``.

The shop itself is preinstalled. See the screenshots for an impression how the setup wizard has looked like.
![Setup wizard. Step 0.](setup_step_0.png?raw=true "Setup wizard. Step 0.")
![Setup wizard. Step 1.](setup_step_1.png?raw=true "Setup wizard. Step 1.")

## Install
```bash
docker build --tag=pe100php .
docker-compose up -d
```
The shop is now callable by `http://localhost/`

Please note: Currently no mail server is installed. Doing a checkout leads to a SMTP error.

## Credentials
Since the demo mode is activate by default (see `config.inc.php::$blDemoMode`), the admin credentials are:
```
username: admin
password: admin
```


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
