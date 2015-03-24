<?php

/**

 * The base configurations of the WordPress.

  *

   * This file has the following configurations: MySQL settings, Table Prefix,

    * Secret Keys, and ABSPATH. You can find more information by visiting

     * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}

      * Codex page. You can get the MySQL settings from your web host.

       *

        * This file is used by the wp-config.php creation script during the

         * installation. You don't have to use the web site, you can just copy this file

          * to "wp-config.php" and fill in the values.

           *

            * @package WordPress

             */



             // ** MySQL settings - You can get this info from your web host ** //

             /** The name of the database for WordPress */

             define('DB_NAME', 'wordpress');



             /** MySQL database username */

             define('DB_USER', 'wordpress');



             /** MySQL database password */

             define('DB_PASSWORD', 'wptjfdk');



             /** MySQL hostname */

             define('DB_HOST', 'localhost');



             /** Database Charset to use in creating database tables. */

             define('DB_CHARSET', 'utf8');



             /** The Database Collate type. Don't change this if in doubt. */

             define('DB_COLLATE', '');



             /**#@+

              * Authentication Unique Keys and Salts.

               *

                * Change these to different unique phrases!

                 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}

                  * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.

                   *

                    * @since 2.6.0

                     */

                     define('AUTH_KEY',         'ViglR/$MJ?(W]vMq0(Ia0Epdadi~J:+aXYa,-Q*XL|%D-X)^(yG^%MYbBZ@TNDW}');

                     define('SECURE_AUTH_KEY',  'D3E[j+KlBU.G+5}avlYShMH#&g.EqsCO.(jv-O*&1lIj;sYM6J+3#i|zo~7xN|+4');

                     define('LOGGED_IN_KEY',    'R6!.Rsl[f(0p#9<.uBmQ;n~yVK:*FMjOOysrGfdg#1;2eP<B$$T[~z$o6Jf9~4x=');

                     define('NONCE_KEY',        '&s!.fzwtK)]1:ymfPG@~:|lLg-b,o_|~z,umZ71d8:[l7{?puc/i+gIKV/TuxdKx');

                     define('AUTH_SALT',        '2NZ.g1@0YZPYf%&2!I)t$mtmU/-}#@TjM@<!YV,=SVanypGTZ_noHM@Hu,+Jh.o]');

                     define('SECURE_AUTH_SALT', 'Uf(PSZ$q=.>p4pCLSi-R)q%EbT6E5;Q{5<87662DRD*|%isF~k?{pVL3E~fDuX;c');

                     define('LOGGED_IN_SALT',   'mefR@_z-lV[%!IntX&ib-yf[(77kXt7|tL+};rj8iQl#Buh|6@-RHb5NB~_xM0*T');

                     define('NONCE_SALT',       'cZ4B$lh0hGot9R%-INadmlHv-+!4-iwEedONbvgXv ,^^5NbhUYmj;-Y7vxkBe|5');



                     /**#@-*/



                     /**

                      * WordPress Database Table prefix.

                       *

                        * You can have multiple installations in one database if you give each a unique

                         * prefix. Only numbers, letters, and underscores please!

                          */

                          $table_prefix  = 'wp_';



                          /**

                           * For developers: WordPress debugging mode.

                            *

                             * Change this to true to enable the display of notices during development.

                              * It is strongly recommended that plugin and theme developers use WP_DEBUG

                               * in their development environments.

                                */

                                define('WP_DEBUG', false);



                                /* That's all, stop editing! Happy blogging. */



                                /** Absolute path to the WordPress directory. */

                                if ( !defined('ABSPATH') )

                                    define('ABSPATH', dirname(__FILE__) . '/');



                                    /** Sets up WordPress vars and included files. */

                                    require_once(ABSPATH . 'wp-settings.php');


