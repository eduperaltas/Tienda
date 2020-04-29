<?php 
$coin_symbol = ConfigurationData::getByPreffix("general_coin")->val;
$img_default = ConfigurationData::getByPreffix("general_img_default")->val;
$cnt=0;
$slides = SlideData::getPublics();
$featureds = ProductData::getFeatureds();
?>
<link rel="stylesheet" href="core/modules/index/view/swiper.min.css">
<link rel="stylesheet" href="core/modules/index/view/index/index.css">
<section>
    <div class="container">

        <div class="row">

            <div class="col-md-12">
                <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
                <?php if(count($slides)>0):?>

                <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <?php foreach($slides as $s):?>
                        <li data-target="#carouselExampleCaptions" data-slide-to="<?php echo $cnt; ?>"
                            <?php if($cnt==0) echo "class="; ?> "active"> </li>
                        <?php $cnt++; endforeach; ?>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <?php $cnt=0; foreach($slides as $s):
                          $url = "admin/storage/slides/".$s->image;
                          ?>

                        <div class="carousel-item <?php if($cnt==0){ echo "active"; }?>">
                            <img src="<?php echo $url; ?>" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h2><?php echo $s->title; ?></h2>
                            </div>
                        </div>
                        <?php $cnt++; endforeach; ?>
                        <!--
        <div class="item">
          <img src="http://placehold.it/800x300" alt="...">
          <div class="carousel-caption">
            <h2>Heading</h2>
          </div>
        </div>
        -->
                    </div>

                    <!-- Controls -->
                    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <br>
                <?php endif; ?>



                <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->


                <?php

                                $nproducts = count($featureds);
                                $filas = $nproducts;
                                $extra = $nproducts;
                                if($filas>1&& $extra>0){ $filas++; }
                                $n=0;
                                ?>
                <?php if(count($featureds)>0):?>

                <div style="background:#333;font-size:25px;color:white;padding:5px;">Productos Destacados</div>

                <br>
                <div class="swiper-container">
                    <div class="swiper-wrapper">


                        <?php for($j=0;$j<$nproducts;$j++):
                                $p=null;
                                if($n<$nproducts){
                                $p = $featureds[$n];
                                }
                                ?>
                        <?php if($p!=null):
                                $img = "admin/storage/products/".$p->image;
                                if($p->image==""){
                                $img=$img_default;
                                }
                                ?>




                        <div class="swiper-slide">
                            <div class="imgBx">
                                <a href="index.php?view=producto&product_id=<?php echo $p->id; ?>"> <img
                                        src="<?php echo $img; ?>"></a>
                            </div>
                            <div class="details">
                                <a style="text-decoration:none" href="index.php?view=producto&product_id=<?php echo $p->id; ?>">
                                    <h3><?php echo $p->name;?></h3>
                                </a>
                                <h3><span><?php echo $coin_symbol." ".number_format($p->price,2,".",","); ?></span>
                                </h3>
                                <?php 
                                            $in_cart=false;
                                            if(isset($_SESSION["cart"])){
                                            foreach ($_SESSION["cart"] as $pc) {
                                                if($pc["product_id"]==$p->id){ $in_cart=true;  }
                                            }
                                            }

                                            ?>
                                <center>

                            </div>

                            </center>
                            </center>
                        </div>

                        <?php endif; ?>


                        <?php $n++; endfor; ?>

                    </div>
                </div>
                <!-- Add Pagination -->
                
                <script type="text/javascript" src="core/modules/index/view/swiper.min.js"></script>

                <script>
                var swiper = new Swiper('.swiper-container', {
                    effect: 'coverflow',
                    grabCursor: true,
                    centeredSlides: true,
                    slidesPerView: 'auto',
                    loop: true,
                    coverflowEffect: {
                        rotate: 0,
                        stretch: 0,
                        depth: 100,
                        modifier: 1,
                        slideShadows: false,
                    },
                    autoplay: {
                        delay: 2500,
                        disableOnInteraction: false,
                    },
                    pagination: {
                        el: '.swiper-pagination',
                    },
                });
                </script>


                <?php else:?>

                <div class="jumbotron">
                    <h2>No hay productos destacados.</h2>
                    <p>En la pagina principal solo se muestran productos marcados como destacados.</p>
                </div>

                <?php endif; ?>



            </div>

        </div>


    </div>
</section>