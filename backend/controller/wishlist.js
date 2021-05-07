const Wishlist = require('../models/wishlist.model');

module.exports.getAllByUser = async function(req, res){
    var customerID = req.params.customerID;
    await Wishlist.findAll({
        where:{
            customerID : customerID
        }
    }).then(function(wishlist) {
        res.json(wishlist);
    });
}

exports.add = (req, res, next) => {
    var query = {};
    query.wishlistID = req.body.customerID;
    query.customerID = req.body.customerID;
    query.productID = req.body.productID;

    console.log(query);

    Wishlist.addOneToWishlist(query, (ret) => {
        if(ret) res.json({
            status: "success"
        });
    });
};

exports.delete = async function(req,res){
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