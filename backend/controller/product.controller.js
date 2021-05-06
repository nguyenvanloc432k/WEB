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
	const imgArr = [];
	req.files.map((item)=>{
		imgArr.push(`http://localhost:4000/${item.path.split("/").slice(1).join("/")}`)
	})
	const product = {
		cateID : req.body.cateID,
		productName :req.body.productName,
		productPrice :req.body.productPrice,
		productQuantity :req.body.productQuantity,
		productImg : imgArr[0],
		productDesciption :req.body.productDesciption,
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

module.exports.updateProduct = async function(req,res){
	let imgArr = req.body.productImg;
	if(req.files){
		imgArr = [];
		req.files.map((item)=>{
			imgArr.push(`http://localhost:4000/${item.path.split("/").slice(1).join("/")}`)
		})
		imgArr = imgArr[0]
	}
	await Product.update({
		cateID : req.body.cateID,
		productName :req.body.productName,
		productPrice :req.body.productPrice,
		productQuantity :req.body.productQuantity,
		productImg : imgArr,
		productDesciption :req.body.productDesciption,
		brandID :req.body.brandID,
		productRAM :req.body.productRAM,
		productSSD :req.body.productSSD,
		productDisplay :req.body.productDisplay,
		productWeight :req.body.productWeight,
		productCPU : req.body.productCPU
		},{
			where:{
				productID : req.body.productID
			}
		})
	res.status(200).send('OK')
}