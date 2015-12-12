<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Dwivit</title>
		<link href="/assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="/assets/css/bootstrap-theme.min.css" rel="stylesheet">
	</head>
	<body>
		<div><b>Propriétaire :</b> <?=$user["nom"]?> <?=$user["prenom"]?><br/>
				 <b>Véhicule :</b> <?=$voiture["marque"]?> <?=$voiture["modele"]?> <?=($voiture["contrat"]["diesel"])?"Diesel":"Essence"?></div>
		<div class="table-responsive">
		  <table class="table table-striped table-condensed">
		    <tr>
		      <th>Date</th>
		      <th>Réparation</th>
		      <th>Commentaire</th>
		    </tr>
				<?php foreach($reparations as $reparation) { ?>
		    <tr >
		      <td><?=implode('/', array_reverse(explode('-', $reparation["date"])));?></td>
		      <td><?=$reparation["type_reparation"]?></td>
		      <td><?=$reparation["commentaire"]?></td>
		    </tr>
				<?php } ?>
		  </table>
		</div>
	</body>
</html>
