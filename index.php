<?php
// el archivo autoload inicializa todos lo archivos necesarios para que el framework funcione
include "core/autoload.php";

//require_once "extenciones/vemdor/autoload.php";
// cargamos el modulo iniciar.
$lb = new Lb();
$lb->loadModule("index");

?>