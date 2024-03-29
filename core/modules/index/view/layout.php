<!doctype html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="core/modules/index/view/layout.css">

    <title>Tienda en Linea</title>

    <link rel="stylesheet" type="text/css" href="res/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="res/lib/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" type="text/css" href="res/lib/fontawesome/css/all.min.css">
    <script src="res/lib/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="core/modules/index/view/swiper.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

</head>

<body>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-xs-5">
                    <br>
                    <h1>Store</h1>
                </div>
                <div class="col-md-7 col-xs-5">
                    <br><br>
                    <!---
<form class="form-horizontal" role="form">
<div class="input-group">
<input type="hidden" name="view" value="productos">
<input type="hidden" name="act" value="search">
      <input type="text" name="q" placeholder="Buscar productos ..." class="form-control">
      <span class="input-group-btn">
        <button class="btn btn-primary" type="button">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>
      </span>
    </div>
</form>
-->
                    <br><br>
                </div>
                <div class="col-md-2 col-xs-2">
                    <!-- cart button -->
                    <br><br>

                </div>

            </div>
        </div>
    </section>





    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <!--  <a class="navbar-brand" href="./">Navbar</a> -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="./"><i class="fa fa-home"></i> Inicio</a>
                    </li>
                    <?php
$cats = CategoryData::getPublics();
?>
                    <?php if(count($cats)>0):?>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-th-list"></i> Categorias
                        </a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <?php foreach($cats as $cat):?>
                            <a class="dropdown-item"
                                href="index.php?view=productos&cat=<?php echo $cat->short_name; ?>&pagina=1"><?php echo $cat->name; ?></a>
                            <?php endforeach; ?>
                        </div>
                    </li>
                    <?php endif; ?>



                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user"></i> Mi cuenta
                        </a>

                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <?php if(isset($_SESSION["client_id"])):?>
                            <a class="dropdown-item" href="index.php?view=client">Mi cuenta</a>
                            <a class="dropdown-item" href="logout.php">Salir</a>
                            <?php else:?>
                            <a class="dropdown-item" href="index.php?view=clientaccess">Iniciar sesion</a>
                            <a class="dropdown-item" href="index.php?view=register">Registro</a>
                            <?php endif; ?>
                        </div>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input type="hidden" name="view" value="productos">
                    <input type="hidden" name="act" value="search">
                    <input class="buscar " name="q" type="search" placeholder="   Buscar ..." aria-label="Buscar ...">
                    <input type="hidden" name="pagina" value="1">
                    <button class="btnbuscar" type="submit"> <i class="fas fa-search"></i></button>
           

                    <a href="index.php?view=mycart" class="btn  btn-secondary my-2 my-sm-0"><i
                            class="fa fa-shopping-cart"></i>
                        <?php if(isset($_SESSION["cart"])):?>
                        <span class="badge"><?php echo count($_SESSION["cart"]); ?></span>
                        <?php endif; ?>
                    </a>


                </form>
            </div>
        </div>
    </nav>





    <br>
    <?php View::load("index"); ?>
    <br><br><br>
    <section>
        <div class="container">

            <!-- - - - -->
            <div class="row">
                <div class="col-md-12">
                    <hr>
                    <ul class="list-inline" >
                        <li class="list-inline-item"> <i class="fas fa-hand-holding-usd fa-3x"
                                style="color:rgb(236, 236, 236); padding-left: 50px;"> </i>
                            <p class="text-muted"> Pago contra entrega</p>
                        </li>

                        <li class="list-inline-item" style="padding-left:82px"> <i class="fab fa-cc-visa fa-3x"
                                style="color:rgb(236, 236, 236); "> </i>
                                <p class="text-muted" style="color:rgb(236, 236, 236); padding-left:11px"> Visa</p>
                            </li>
                        <li class="list-inline-item" style="padding-left:82px;"> <i class="fab fa-cc-mastercard fa-3x"
                                style="color:rgb(236, 236, 236);padding-left:16px "> </i>
                                <p class="text-muted" style="color:rgb(236, 236, 236);"> Master Card
                            </p>
                            </li>
                        <li class="list-inline-item" style="padding-left:82px;"> <i class="fab fa-cc-amex fa-3x"
                                style="color:rgb(236, 236, 236);padding-left:30px "> </i>
                                <p class="text-muted" style="color:rgb(236, 236, 236); "> American
                                Express</p>
                            </li>
                        <li class="list-inline-item" style="padding-left:82px;"> <i class="fab fa-cc-diners-club fa-3x"
                                style="color:rgb(236, 236, 236);padding-left:16px "> </i>
                                <p class="text-muted" style="color:rgb(236, 236, 236); "> Diners Club</p>
                            </li>
                        <li class="list-inline-item" style="padding-left:82px"> <i class="fas fa-donate fa-3x"
                                style="color:rgb(236, 236, 236);padding-left:37px "> </i>
                            
                                <p class="text-muted" style="color:rgb(236, 236, 236); "> Depósito
                                Bancario</p>
                            </li>
                    </ul>

                   


                    <hr>
                    <p><b>Store Lite</b> &copy; 2019</p>
                   
                </div>
    </section>
    <br>
    <script src="res/lib/bootstrap/js/bootstrap.min.js"></script>
    <script>
    $(".tip").tooltip();
    </script>
</body>

</html>