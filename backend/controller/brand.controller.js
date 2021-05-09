const Brand = require('../models/brand.model');
const {Op} = require('sequelize');
module.exports.getAll = async function(req,res){
    var brands = await Brand.findAll();
    res.json(brands);
}
module.exports.getById = async function(req, res) {
	var id = req.params.id;
	Brand.findOne({
		where :{
			brandID :{
				[Op.eq] : id
			}
		}
	}).then(function(brand) {
		res.json(brand);
	});
}
module.exports.updateBrand = async function(req,res){
	var brandID = req.params.id;
	console.log(req.body.brandName);
	console.log(req.body);
	Brand.update({
		brandName : req.body.brandName
	},{
		where:{
			brandID : brandID
		}
	})
	.then(data=>{res.status(200).send("OK")})
	.catch(err=>res.status(500).send(err))
}

module.exports.postBrand = async function(req,res){
    const brand = await Brand.create({
        brandName : req.body.brandName
    });
    brand.save();
	res.status(200).send(brand);
}