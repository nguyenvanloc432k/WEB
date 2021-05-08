const Product = require('../models/product.model');
const {Op} = require('sequelize');

module.exports.getAll = async function(req,res){
    var products = await Product.findAll();
    res.json(products);
}

module.exports.getById = async function(req, res) {
	var id = req.params.id;
	Product.findOne({
		where :{
			productID :{
				[Op.eq] : id
			}
		}
	}).then(function(products) {
		res.json(products);
	});
}

module.exports.deleteProduct = async function(req,res){
	var productID = req.params.id;
	await Product.destroy({
		where:{
			productID : productID
		}
	});
	res.status(200).send("OK");
}

module.exports.postProduct = async function(req,res){
	let imgArr = [];
	req.files.map((item)=>{
		imgArr.push(`http://localhost:4000/${item.path.split("/").slice(1).join("/")}`)
	})
	imgArr = imgArr.join(",")

	const product = {
		cateID : req.body.cateID,
		productName :req.body.productName,
		productPrice :req.body.productPrice,
		productQuantity :req.body.productQuantity,
		productImg : imgArr,
		productDescription :req.body.productDescription,
		brandID :req.body.brandID,
		productRAM :req.body.productRAM,
		productSSD :req.body.productSSD,
		productDisplay :req.body.productDisplay,
		productWeight :req.body.productWeight,
		productCPU : req.body.productCPU
	}
	await Product.create(product)
	res.status(200).send(product)
}

function myFunc(value,index,array){
	return parseInt(value)-1
}

module.exports.updateProduct = async function(req,res){
	let img_origin = await Product.findOne({
		attributes : ['productImg'],
		where : {
			productID : {
				[Op.eq]: req.params.id
			}
		}
	});
	img_origin = img_origin.getDataValue('productImg').split(',');
	let img_new = []
	if(req.body.indexDeleted){
		let index_deleted = req.body.indexDeleted.split(",");
		// covert index(string to number)
		let deleted = index_deleted.map(myFunc);
		for (var i = 0; i < img_origin.length;i++){
			if(deleted.indexOf(i) == -1) img_new.push(img_origin[i]);
		}
	}else{
		img_new = img_origin;
	}
	if(req.files){
		req.files.map((item)=>{
			img_new.push(`http://localhost:4000/${item.path.split("/").slice(1).join("/")}`)
		})
	}
	img_new = img_new.join(',')
	await Product.update({
		cateID : req.body.cateID,
		productName :req.body.productName,
		productPrice :req.body.productPrice,
		productQuantity :req.body.productQuantity,
		productImg : img_new,
		productDescription :req.body.productDescription,
		brandID :req.body.brandID,
		productRAM :req.body.productRAM,
		productSSD :req.body.productSSD,
		productDisplay :req.body.productDisplay,
		productWeight :req.body.productWeight,
		productCPU : req.body.productCPU
		},{
			where:{
				productID : req.params.id
			}
		})
	res.status(200).send('OK')
}

/*module.exports.reviewProduct = async function(req,res){
	var id = req.params.id;

}*/