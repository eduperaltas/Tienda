<?php
class ProductData {
	public static $tablename = "product";


	public function ProductData(){
		$this->title = "";
		$this->content = "";
		$this->image = "";
		$this->Image2 = "";
		$this->Image3 = "";
		$this->Image4 = "";
		$this->link = "";
		$this->category_id = "";
		$this->is_public = "0";
		$this->Stock = "";
		$this->created_at = "NOW()";
	}

	public function getUnit(){ return UnitData::getById($this->unit_id);}

	public function add(){
		$sql = "insert into ".self::$tablename." (short_name,code,name,description,image,Image2,Image3,Image4,price,link,category_id,unit_id,is_public,in_existence,Stock,is_featured,created_at) ";
		$sql .= "value (\"$this->short_name\",\"$this->code\",\"$this->name\",\"$this->description\",\"$this->image\",\"$this->Image2\",\"$this->Image3\",\"$this->Image4\",\"$this->price\",\"$this->link\",$this->category_id,$this->unit_id,$this->is_public,$this->in_existence,$this->Stock,$this->is_featured,$this->created_at)";
		Executor::doit($sql);
	}

	public static function delById($id){
		$sql = "delete from ".self::$tablename." where id=$id";
		Executor::doit($sql);
	}
	public function del(){
		$sql2 = "delete from product_view where id=$this->id";
		Executor::doit($sql2);
		$sql = "delete from ".self::$tablename." where id=$this->id";
		Executor::doit($sql);
	}

// partiendo de que ya tenemos creado un objecto ProductData previamente utilizamos el contexto
	public function update(){
		$sql = "update ".self::$tablename." set code=\"$this->code\",name=\"$this->name\",description=\"$this->description\",link=\"$this->link\",price=\"$this->price\",in_existence=\"$this->in_existence\",Stock=\"$this->Stock\",is_public=\"$this->is_public\",is_featured=\"$this->is_featured\",unit_id=\"$this->unit_id\",category_id=\"$this->category_id\" where id=$this->id";
		Executor::doit($sql);
	}
// resta de stock
	public function updateStock($newstock, $id){
		$sql = "update ".self::$tablename." set Stock=$newstock where id=$id";
		Executor::doit($sql);
	}

	public function update_image(){
		$sql = "update ".self::$tablename." set image=\"$this->image\" where id=$this->id";
		Executor::doit($sql);
	}
	public function update_Image2(){
		$sql = "update ".self::$tablename." set Image2=\"$this->Image2\" where id=$this->id";
		Executor::doit($sql);
	}
	public function update_Image3(){
		$sql = "update ".self::$tablename." set Image3=\"$this->Image3\" where id=$this->id";
		Executor::doit($sql);
	}
	public function update_Image4(){
		$sql = "update ".self::$tablename." set Image4=\"$this->Image4\" where id=$this->id";
		Executor::doit($sql);
	}

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new ProductData());
	}



	public static function getAll(){
		$sql = "select * from ".self::$tablename." order by created_at desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getPublicsByCategoryId($id){
		$sql = "select * from ".self::$tablename." where category_id=$id and is_public=1 order by created_at desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function get4News(){
		$sql = "select * from ".self::$tablename." where is_new=1 and is_public=1 order by created_at desc limit 4";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function get4Offers(){
		$sql = "select * from ".self::$tablename." where is_offer=1 and is_public=1 order by created_at desc limit 4";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getNews(){
		$sql = "select * from ".self::$tablename." where is_new=1 and is_public=1 order by created_at desc limit 4";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}

	public static function getFeatureds(){
		$sql = "select * from ".self::$tablename." where is_featured=1 and is_public=1 order by created_at desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}


	public static function getLike($q){
		$sql = "select * from ".self::$tablename." where name like '%$q%' or description like '%$q%'";
		$query = Executor::doit($sql);
		return Model::many($query[0],new ProductData());
	}


}

?>