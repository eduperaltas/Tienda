<?php
$total = 0;
$iva = ConfigurationData::getByPreffix("general_iva")->val;
$coin_symbol = ConfigurationData::getByPreffix("general_coin")->val;
$ivatxt = ConfigurationData::getByPreffix("general_iva_txt")->val;

?>
<div class="container">
	<div class="row">

		<div class="col-md-12">
			<?php if(!isset($_SESSION["client_id"])):?>
				<p class="alert alert-danger">Debes registrarte e iniciar sesion para proceder.</p>
			<?php endif; ?>
		</div>
</div>

	<div class="row">

		<div class="col-md-12">
			<?php if(isset($_SESSION["cart"]) && count($_SESSION["cart"]>0)):?>
		<h2>Mi Carrito</h2>
<table class="table table-bordered">
<thead>
	<th><Center>Codigo</th>
	<th><Center>Imagen</th>
	<th><Center>Producto</th>
	<th><Center>Cantidad</th>
	<th><Center>Precio Unitario</th>
	<th><Center>Total</th>
	<th><Center>Eliminar</th>
</thead>
<?php 
foreach($_SESSION["cart"] as $s):?>
<?php $p = ProductData::getById($s["product_id"]); ?>
<tr>
<td style="padding-top:35px" style="padding-top:35px"> <center> <?php echo $p->code; ?></center></td>
<td><center> <a href="index.php?view=producto&product_id=<?php echo $p->id; ?>"> <?php $img = "admin/storage/products/".$p->image; ?> <img src="<?php echo $img; ?>" style=" width: 80px;height: 80px;"   alt=""></a> </center></td> 
<td style="padding-top:35px"><center><?php echo $p->name; ?></center></td>
<td  style="padding-top:35px; width:100px;">
<form id="p-<?=$s["product_id"];?>">
<input type="hidden" name="p_id" value="<?=$s["product_id"];?>">

<input type="number" name="q" id="num-<?=$s["product_id"];?>" value="<?php echo $s["q"]; ?>" class="form-control" min="1" max="<?php echo $p->Stock; ?>">

</form>
<script>
	$("#num-<?=$s['product_id'];?>").change(function(){
		$.post("./?action=editcart",$("#p-<?=$s['product_id']?>").serialize()	,function(data){
			window.location = window.location;

		});
	});
</script>
</td>
<td style="padding-top:35px"><center><h4><?php echo $coin_symbol; ?> <?php echo $p->price; ?></h4> </td>
<td style="padding-top:35px"><center><h4><?php echo $coin_symbol; ?> <?php echo $p->price*$s["q"]; ?></h4> </td>
<td style="padding-top:35px" style="width:30px;"><center><a href="index.php?action=deletefromcart&product_id=<?php echo $p->id; ?>&href=cart" class="btn btn-danger"><i class="fa fa-trash"></i></a></td>
<?php
$total += $s["q"]*$p->price;
 endforeach; ?>
</tr>
</table>



<div class="row">
<div class="col-md-7">

</div>
<div class="col-md-5 col-md-offset-2">
	<table class="table table-bordered">
		<tr>
			<td>Subtotal</td><td><?php echo $coin_symbol; ?> <?php echo number_format($total-($total*($iva/100)),2,".",","); ?></td>
		</tr>
		<tr>
			<td><?php echo $ivatxt; ?></td><td><?php echo $coin_symbol; ?> <?php echo number_format($total*($iva/100),2,".",","); ?></td>
		</tr>
		<?php if(isset($_SESSION["coupon"])):?>
	<?php else:?>
		<tr>
			<td>Total</td><td><?php echo $coin_symbol; ?> <?php echo number_format($total,2,".",","); ?></td>
		</tr>

	<?php endif; ?>

	</table>
<br>
			<?php if(isset($_SESSION["client_id"])):?>
<form action="index.php?view=checkout" method="post">
<label>Metodo de pago</label>
<select class="form-control" required name="paymethod_id">
<?php foreach(PaymethodData::getActives() as $pay):?>
	<option value="<?php echo $pay->id; ?>"><?php echo $pay->name; ?></option>
<?php endforeach; ?>
</select><br>
<button class="btn btn-primary btn-block">Confirmar Comprar</button>
</form>
<?php endif; ?>
<br>
<a href="index.php?action=cleancart" class="btn btn-danger btn-block">Limpar Carrito</a>
</div>
</div>



			<?php else:
			?>
				<div class="jumbotron">
				<h2>No hay productos</h2>
				<p>No ha agregado productos al carrito.</p>
				</div>
			<?php endif; ?>
		</div>
	</div>
</div>