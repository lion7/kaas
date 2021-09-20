<?php
	// OIDC Server Configuration, introduced in Kopano Core 8.7.0
	define("OIDC_ISS", "https://\(.domain)");
	define("OIDC_CLIENT_ID", "webapp-\(.domain)");
	define("OIDC_SCOPE", "openid profile email kopano/gc");
?>
