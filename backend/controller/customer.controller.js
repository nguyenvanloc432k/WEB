const Customer = require('../models/customer.model');
const {Op} = require('sequelize');

module.exports.getAll = async function(req,res){
    var customers = await Customer.findAll();
    res.json(customers);
}
module.exports.getById = async function(req, res) {
	var id = req.params.id;
	Customer.findOne({
		where :{
			customerID :{
				[Op.eq] : id
			}
		}
	}).then(function(Customer) {
		res.json(Customer);
	});
}
module.exports.deleteCustomer = async function(req,res){
	var customerID = req.params.id;
	Customer.destroy({
		where:{
			customerID : customerID
		}
	});
	res.status(200).send("OK");
}

module.exports.postCustomer = async function(req,res){

	const customer = {
		customerName :req.body.customerName,
		address :req.body.address,
		city :req.body.city,
		country : req.body.country,
		phone :req.body.phone,
		email :req.body.email,
		password :req.body.password,
	}
	Customer.create(customer)
	.then(data=>{res.status(200).send(data)})
	.catch(err=>res.status(500).send(err))
}

module.exports.updateCustomer = async function(req,res){

	Customer.update({
		customerName :req.body.customerName,
		address :req.body.address,
		city :req.body.city,
		country : req.body.country,
		phone :req.body.phone,
		email :req.body.email,
		password :req.body.password,
		},{
			where:{
				customerID : req.params.id
			}
		})
		.then(data=>{res.status(200).send("OK")})
		.catch(err=>res.status(500).send(err))
}