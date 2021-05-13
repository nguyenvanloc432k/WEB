const Order = require('../models/order.model');
const {Op} = require('sequelize');

module.exports.getAll = async function(req,res){
    var orders = await Order.findAll();
    res.json(orders);
}

module.exports.getById = async function(req, res) {
	var id = req.params.id;
	Order.findOne({
		where :{
			orderID :{
				[Op.eq] : id
			}
		}
	}).then(function(Order) {
		res.json(Order);
	});
}

module.exports.deleteOrder = async function(req,res){
	var orderID = req.params.id;
	Order.destroy({
		where:{
			orderID : orderID
		}
	});
	res.status(200).send("OK");
}

module.exports.postOrder = async function(req,res){

	const order = {
        orderID :req.body.orderID,
		dateOrder :req.body.dateOrder,
		orderStatus :req.body.orderStatus,
		customerID :req.body.customerID,
		number : req.body.number,
	}
	Order.create(order)
	.then(data=>{res.status(200).send(data)})
	.catch(err=>res.status(500).send(err))
}

module.exports.updateOrder = async function(req,res){

	Order.update({
        orderId :req.body.orderID,
		dateOrder :req.body.dateOrder,
		orderStatus :req.body.orderStatus,
		customerID :req.body.customerID,
		number : req.body.number,
		})
		.then(data=>{res.status(200).send("OK")})
		.catch(err=>res.status(500).send(err))
}