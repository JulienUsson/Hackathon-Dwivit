<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'app';

//----------Contrat----------
$route['api/contrats'] = 'contrat';
$route['api/contrats/(:num)'] = 'contrat/view/$1';
//----------Consommation_essence----------
$route['api/consommations'] = 'consommation_essence';
$route['api/consommations/(:num)'] = 'consommation_essence/view/$1';
//----------Marque----------
$route['api/marques'] = 'marque';
$route['api/marques/(:num)'] = 'marque/view/$1';
//----------Modele_voiture----------
$route['api/modeles'] = 'modele_voiture';
$route['api/modeles/(:num)'] = 'modele_voiture/view/$1';
//----------Reparation----------
$route['api/reparations'] = 'reparation';
$route['api/reparations/(:num)'] = 'reparation/view/$1';
//----------Type_reparation----------
$route['api/reparations/types'] = 'type_reparation';
$route['api/reparations/types/(:num)'] = 'type_reparation/view/$1';
//----------Voiture----------
$route['api/voitures'] = 'voiture';
$route['api/voitures/(:num)'] = 'voiture/view/$1';
//----------Users----------
$route['api/users'] = 'user';
$route['api/users/(:num)'] = 'user/view/$1';

$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
