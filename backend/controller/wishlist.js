const Wishlist = require('../models/wishlist.model');

module.exports.getAllByUser = async function(req, res){
    var customerID = req.params.customerID;
    Wishlist.findOne({
        where:{
            customerID : customerID
        }
    }).then(function(wishlist) {
        res.json(wishlist);
    });
}

module.exports.addOneToWishlist = async function(req, res){
    const wishlist = {
        customerID : req.body.customerID,
        productID : req.body.productID
    };

    console.log(wishlist);

    await Wishlist.create(wishlist);
    res.status(200).send(wishlist);
};

module.exports.deleteOne = async function(req,res){
    var customerID = req.body.customerID;
	var productID = req.body.productID;
	await Wishlist.destroy({
		where:{
            customerID : customerID,
			productID : productID
		}
	});
	res.status(200).send("OK");
}