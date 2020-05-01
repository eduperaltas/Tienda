<?php

if(isset($_SESSION["admin_id"])){

$buy =  BuyData::getById($_GET["id"]);
$buy->status_id = $_GET["status"];
$buy->change_status();

if ($_GET["status"]==5) {
    $id=$_GET["id"];
    $ns=$_GET["ns"];
    $idp=$_GET["idp"];
    Core::redir("?action=reststock&id=$id&status=5&ns=$ns&idp=$idp");
} else{
    Core::redir("index.php?view=sells");
}

}
?>



