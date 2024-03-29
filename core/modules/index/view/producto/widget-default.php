<?php 
$p = ProductData::getById($_GET["product_id"]);
$img_default = ConfigurationData::getByPreffix("general_img_default")->val;
$coin_symbol = ConfigurationData::getByPreffix("general_coin")->val;

Viewer::addView($p->id,"product_id","product_view");

 ?>

<!-- <link rel="stylesheet" href="core/modules/index/view/producto/producto.css">-->
<link rel="stylesheet" href="core/modules/index/view/producto/jquery.exzoom.css">


<section>
    <div class="container">

        <div class="row">
            <div class="col-md-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">Categorias</div>


                    <?php
                        $cats = CategoryData::getPublics();
                        ?>
                    <?php if(count($cats)>0):?>
                    <div class="list-group">
                        <?php foreach($cats as $cat):?>

                        <a href="index.php?view=productos&cat=<?php echo $cat->short_name; ?>&pagina=1"
                            class="list-group-item"><i class="fa fa-chevron-right"></i> <?php echo $cat->name; ?></a>
                        <?php endforeach; ?>
                    </div>
                    <?php endif; ?>
                </div>
            </div>
            <div class="col-md-9">
                <div style="background:#3498db;font-size:35px;color:white;padding:5px;font-weight:600;"><?php echo $p->name; ?></div>
                <br>



                <?php if($p!=null):
                    $img = "admin/storage/products/".$p->image;
                    $img2 = "admin/storage/products/".$p->Image2;
                    $img3 = "admin/storage/products/".$p->Image3;
                    $img4 = "admin/storage/products/".$p->Image4;


                    ?>
                <div class="row">
                    <div class="col-md-8">

                        <div class="exzoom" id="exzoom" >
                            <!-- Images -->
                            <div class="exzoom_img_box">
                                <ul class='exzoom_img_ul'>

                                    <li><img src="<?php echo $img; ?>"> </li>
                                    <li><img src="<?php echo $img2; ?>"/></li> <!-- Agregar otras imagenes de la BD-->
                                    <li><img src="<?php echo $img3; ?>"/></li> <!-- Agregar otras imagenes de la BD-->
                                    <li><img src="<?php echo $img4; ?>"/></li> <!-- Agregar otras imagenes de la BD-->
                                    
                                </ul>
                            </div>
                            <!-- <a href="https://www.jqueryscript.net/tags.php?/Thumbnail/">Thumbnail</a> Nav-->
                            <div class="exzoom_nav"></div>


                        </div>


                        <!--<center>   <img src="<?php echo $img; ?>" ></center>-->


                    </div>




                    <div class="col-md-4" style="padding-top:60px">
                        <h1 class="text-primary"><?php echo $coin_symbol; ?>
                            <?php echo number_format($p->price,2,".",","); ?></h1>
                        <?php 
$in_cart=false;
if(isset($_SESSION["cart"])){
  foreach ($_SESSION["cart"] as $pc) {
    if($pc["product_id"]==$p->id){ $in_cart=true;  }
  }
  }

  ?>
                        <?php if(!$p->in_existence || $p->Stock<=0):?>
                        <a href="javascript:void()" class="btn btn-labeled btn-warning tip" title="No Disponible">
                            <span><i class="fa fa-shopping-cart"></i></span> No Disponible</a>

                        <?php elseif(!$in_cart):?>
                        <a href="index.php?action=addtocart&product_id=<?php echo $p->id; ?>&href=product"
                            class="btn btn-labeled btn-primary tip" title="A&ntilde;adir al carrito">
                            <span><i class="fa fa-shopping-cart"></i></span> Comprar</a>
                        <?php else:?>
                        <a href="javascript:void()"
                            class="btn btn-labeled btn-success tip" title="Ya esta en el carrito">
                            <span><i class="fa fa-shopping-cart"></i></span> Ya esta agregado</a>

                        <?php endif; ?>
                        <?php if($p->in_existence && $p->Stock>0):?>    
                        <p class="text-success">Producto en Existencia</p>
                        <div class="badge badge-success"> 
                          Stock: <?php echo $p->Stock; ?>
                          </div>

                        <?php else:?>                           
                        <p class="text-warning">Producto no disponible</p>
                        <?php endif; ?>
                        
                        <?php if ($p->video!=null) {   
                        echo '<iframe width="365" height="230"'. 'src="https://www.youtube-nocookie.com/embed/'.htmlspecialchars($p->video).'?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
                        } ?>
                    </div>
                </div>
                <br><br>
                <div class="row">
                    <div class="col-md-12">
                        <hr>
                        <h4>Codigo: <?php echo $p->code; ?></h4>
                        <h4>Descripcion:</h4>
                        <p><?php echo $p->description; ?></p>
                    </div>
                </div>

                <?php endif; ?>



            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
        <script src="core/modules/index/view/producto/jquery.exzoom.js"></script>
        <script type="text/javascript">
        $(function() {

            $("#exzoom").exzoom({

                
                // thumbnail nav options
                "navWidth": 100,
                "navHeight": 100,
                "navItemNum": 5,
                "navItemMargin": 7,
                "navBorder": 0,

                // autoplay
                "autoPlay": false,

            });


        });
        </script>
        

    </div>
</section>