<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ' EljvK=gu`V8@39T6.os@/$MAI0l8{z-4>&Ld/Bk[KmL,I#I[U&7z|n;+r^rCb-|');
define('SECURE_AUTH_KEY',  'BsdY1N<<nq~xkCWT(MV4kKY^XG$q{,-bjP:p,fBj-Ynw%-1~Hq n.WNNZy`zmw r');
define('LOGGED_IN_KEY',    'JcxU0<_Bv&1VbDc7tgej7,[L+K!T6<]Kcz<<Lqwwhv()d|WHSLO5E)2C0 nkF1yS');
define('NONCE_KEY',        '/M KiM_15d3tvT^V`9{5m 4=Zoe}h!z2)(U&%MSfo`AI:8(sVRkQ{`XS%qG`.)ez');
define('AUTH_SALT',        'bf;X&QHfV~xVU1FbpXQ:gG63k}iC?HyG<+0Js@D&xaD5482N)VC9c,J^QWCy5L*c');
define('SECURE_AUTH_SALT', 'g~v%yj;Yq3E1zI<N}+--x-@HQ1ewvrE%5<6%`-6]f$KA Mase3<3DgxrfI_jyJ|O');
define('LOGGED_IN_SALT',   'cIN]=rJ+f^A59L~4?$kTrT(Dy(sSx:V,7-0=bU-&e~IYX=f|hL|~WLt{N=>:8R&i');
define('NONCE_SALT',       'M R y)3:c)eiw},$tg#>lf7Zv$P2}pbEH|qj2Lb3ovV}rVt)eh1S1]b^@)Gv(X[j');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
