const Cart = require('../models/cart.model');
const Product = require('../models/product.model');
const CartProduct = require('../models/cart_product.model');

module.exports.getAllByUser = async function(req, res){
    var customerID = req.params.customerID;

    await Cart.findAll({
        where: {
            customerID : customerID
        }
    }).then(function(data) {
        res.json(data);
    });
};

module.exports.addOneToCart = async function(req, res) {
    
    var cart = {
        customerID : req.body.customerID,
        productID : req.body.productID
    } 

    console.log(cart);

    await Cart.create(cart);
    res.status(200).send('Success!');
};

module.exports.countProduct = async function(req, res) {

    await Cart.count({
        where: {
            customerID: req.params.customerID
        }
    }).then(function(data){
        res.json(data);
    })
}

module.exports.deleteOne = async function(req, res) {

    await Cart.destroy({
        where: {
            customerID: req.body.customerID,
            productID: req.body.productID
        }
    }).then(function(rowDeleted){ // rowDeleted will return number of rows deleted
        if(rowDeleted === 1){
           res.status(200).send('Deleted successfully');
         }
      }, function(err){
          console.log(err); 
      });
}