const String baseUrl = "https://arsdev.thefixable.com/wp-json/wp/v2";
const String getRecentlyAdded =
    "$baseUrl/carleader-listing/?_fields=metadata,id,title,content,make-brand,body-type,images&per_page=5";
const String getCatgeroyRequestUrl = "$baseUrl/body-type";
const String getCatgeroyDateRequestUrl =
    "https://arsdev.thefixable.com/wp-json/wp/v2/carleader-listing/?body-type=";
const String getMyListingsDataRequestUrl =
    "$baseUrl/carleader-listings/?_fields=&author=";
const String postResgisterUrl = "$baseUrl/users";
const String postupdateUrl = "$baseUrl/users/";
const String postupdFiltterUrl =
    "https://arsdev.thefixable.com/wp-json/wp/v2/carleader-listing/?_fields=&";
const String postForgetPasswordUrl =
    "https://arsdev.thefixable.com/wp-json/bdpwr/v1/reset-password";
const String postSetNewPasswordUrl =
    "https://arsdev.thefixable.com/wp-json/bdpwr/v1/set-password";
const String getTokenUrl =
    "https://arsdev.thefixable.com/wp-json/jwt-auth/v1/token";
const String getUserTokenUrl =
    "https://arsdev.thefixable.com/wp-json/jwt-auth/v1/token";
const String postLogin = "https://arsdev.thefixable.com/wp-json/ars/login";
