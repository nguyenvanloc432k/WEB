
var sequelize = require('../database/db')
var Wishlist = require('../models/wishlist.model');

exports.getWishlist = (query, cb) => {
    var customerID = query.customerID;

    var sql = "SELECT distinct * FROM laptop.Wishlist join laptop.Product on Wishlist.productID = Product.productID where customerID = " + customerID;

    sequelize.query(sql).then((data) => {
        cb(data);
    });
}