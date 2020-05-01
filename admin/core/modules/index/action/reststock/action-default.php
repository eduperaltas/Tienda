<?php

if(isset($_SESSION["admin_id"])){

    $buy =  BuyData::getById($_GET["id"]);

    if ($buy->status_id = $_GET["status"] == "5"){

        
        $nuevoStock =$_GET["ns"];
        $idp =$_GET["idp"];

        $upStock = ProductData::updateStock($nuevoStock,$idp);

        Core::redir("index.php?view=sells");
    }
 
}
?>