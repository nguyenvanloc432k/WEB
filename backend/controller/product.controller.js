const Product = require('../models/product.model');
const {Op} = require('sequelize');
let Brand = require('../models/brand.model')

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
module.exports.filter = async function(req, res) {
	var min_price = req.query.minPrice;
	var max_price = req.query.maxPrice;
	var SSD = req.query.SSD;
	var RAM = req.query.RAM;
	var CPU = req.query.CPU;
	var min_weight = req.query.minWeight;
	var max_weight = req.query.maxWeight;
	var brand = req.query.brand;

	var whereObj = {};
	if(min_price && max_price){
		whereObj.productPrice = {
			[Op.between] : [min_price,max_price]
		}
	};
	if(SSD){
		whereObj.productSSD = {
			[Op.eq] : SSD
		}
	};
	if(RAM){
		whereObj.productRAM = {
			[Op.eq] : RAM
		}
	};
	if(CPU){
		whereObj.productCPU = {
			[Op.eq] : CPU
		}
	};
	if(min_weight&&max_weight){
		whereObj.productWeight = {
			[Op.between] : [min_weight,max_weight]
		}
	};
	if(brand){
		console.log(brand)
		var brandID = await Brand.findOne(
			{
				where:{
					brandName : brand
				}
			}
		)
		console.log(brandID)
		whereObj.brandID = {
			[Op.eq] : brandID.getDataValue('brandID')
		}
	}
	Product.findAll({
		where : whereObj
	}).then(data=>{res.status(200).send(data)})
	.catch(err=>res.status(500).send(err))
}

module.exports.deleteProduct = async function(req,res){
	var productID = req.params.id;
	Product.destroy({
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
	Product.create(product)
	.then(data=>{res.status(200).send(data)})
	.catch(err=>res.status(500).send(err))
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
	Product.update({
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
		.then(data=>{res.status(200).send("OK")})
		.catch(err=>res.status(500).send(err))
}

module.exports.reviewProduct = async function(req,res){
	await Product.update(
		{productVote : req.body.productVote},
		{
			where:{
				productID : req.params.id
		}
		}
	)
	res.status(200).send('OK');
}