
<?php 
if(isset($_GET["cat"])){
$cat = CategoryData::getByPreffix($_GET["cat"]);
$products = ProductData::getPublicsByCategoryId($cat->id);
}else if(isset($_GET["opt"])){
if($_GET["opt"]=="news"){
$products = ProductData::getNews();
}
else if($_GET["opt"]=="offers"){
$products = ProductData::getOffers();
}

}else if(isset($_GET["act"]) && $_GET["act"]=="search"){
$products = ProductData::getLike($_GET["q"]);

}

$coin = ConfigurationData::getByPreffix("general_coin")->val;
$img_default = ConfigurationData::getByPreffix("general_img_default")->val;

 ?>
 <link rel="stylesheet" href="core/modules/index/view/productos/productos.css">

<section>
  <div class="container">

  <div class="row">

  <div class="col-md-12">
    <div style="background:#333;font-size:25px;color:white;padding:5px;"><?php 
    if(isset($_GET["act"]) && $_GET["act"]!=""){ echo "Busqueda: ".$_GET["q"]; }else { echo $cat->name; } ?></div>
<br>
<?php

$nproducts = count($products);
$card_x_pagina = 12; /* numero de cosas por pagina*/ 
$paginas = ceil($nproducts/$card_x_pagina); /*paginas*/ 


$filas = $nproducts/3;
$extra = $nproducts%3;
if($filas>1&& $extra>0){ $filas++; }
$n=0;
?>

<?php if($nproducts>0):?>

<?php for($i=0;$i<$filas;$i++):?>

  <div class="row">



<?php 
$n =($_GET['pagina']-1)*$card_x_pagina;
for($i=0;$i<$card_x_pagina;$i++): //numero de cards por fila
$p=null;
if($n<$nproducts){   //numero de cards pagina
$p = $products[$n];
}
?>

<?php if($p!=null):
$img = "admin/storage/products/".$p->image;
if($p->image==""){
  $img=$img_default;
}

?>

<!-- Cartas de Productos-->
<div class="col-md-4">
    
    <div class="card">

 <center> <a href="index.php?view=producto&product_id=<?php echo $p->id; ?>">  <img src="<?php echo $img; ?>" class="card-img-top" alt="..."></center></a> 
 <br>
  <h4  class="card-title"><?php echo $p->name; ?> </h4>
<h3 class="card-text"><?php echo $coin; ?> <?php echo number_format($p->price,2,".",","); ?></h3>
<?php 
$in_cart=false;
if(isset($_SESSION["cart"])){
  foreach ($_SESSION["cart"] as $pc) {
    if($pc["product_id"]==$p->id){ $in_cart=true;  }
  }
  }

  ?>

<div class="card-footer"> 
<center>

                </center>
<?php
 if(!$p->in_existence || $p->Stock<=0):?>

<a href="javascript:void()" class="btn btn-labeled  btn-warning tip" title="No disponible"> <!-- aca pregunto si es que esa en existencia de eso depende la posibilidad de compra -->
                <span><i class="fa fa-shopping-cart"></i></span> No Disponible</a>
<br>

<?php elseif(!$in_cart):?>

<a href="index.php?action=addtocart&product_id=<?php echo $p->id; ?>&href=cat&pagina=<?php echo $_GET['pagina']?>" class="btn btn-labeled  btn-primary tip" title="A&ntilde;adir al carrito">
                <span ><i class="fa fa-shopping-cart"></i></span> Comprar</a>
<br>
<?php else:?>
<center><a href="javascript:void()" class="btn btn-labeled  btn-success tip" title="Ya esta en el carrito">
                <span ><i class="fa fa-shopping-cart"></i></span> Ya esta agregado</a>
<br>
<?php endif; ?> </div>



  </div>
   </div>
<?php endif; ?>
<?php $n++; endfor; ?>

  </div>
<?php endfor; ?>
<?php else:?>
  <div class="jumbotron">
  <h2>No hay productos</h2>
  <p>No hay productos por mostrar</p>
  </div>
<?php endif;?>



<!-- BARRA Y PAGINACION-->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item <?php echo $_GET['pagina']<=1 ?'disabled': '' ?>">
      <a class="page-link" href="index.php?view=productos&cat=<?php echo$_GET['cat']?>&pagina=<?php echo $_GET['pagina']-1 ?>" tabindex="-1" aria-disabled="true">Anterior</a>
    </li>

    <?php for ($i=0; $i < $paginas; $i++): ?>


    <li class="page-item <?php echo $_GET['pagina']==$i+1 ? 'active' : '' ?>">
    <a class="page-link" href="index.php?view=productos&cat=<?php echo$_GET['cat']?>&pagina=<?php echo $i+1?>">
    <?php echo $i+1?>
    </a>
    </li>
    
    <?php endfor?>
    

    <li class="page-item <?php echo $_GET['pagina']>=$paginas ?'disabled': '' ?>">
      <a class="page-link" href="index.php?view=productos&cat=<?php echo$_GET['cat']?>&pagina=<?php echo $_GET['pagina']+1 ?>">Siguiente</a>
    </li>
  </ul>
</nav>



  </div>
  </div>


  </div>
  </section>
