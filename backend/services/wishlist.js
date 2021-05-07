
var sequelize = require('../database/db')
var Wishlist = require('../models/wishlist.model');

exports.getWishlist = (query, cb) => {
    var customerID = query.customerID;

    var sql = "SELECT distinct * FROM laptop.Wishlist join laptop.Product on Wishlist.productID = Product.productID where customerID = " + customerID;

    sequelize.query(sql).then((data) => {
        cb(data);
    });
}

exports.addOneToWishlist = (query, cb) => {
    var queryObj = {};
    queryObj.wishlistID = query.customerID;
    queryObj.customerID = query.customerID;
    queryObj.productID = query.productID;

    console.log(queryObj);

    var sql = "INSERT INTO `laptop`.`Wishlist`(`wishListID`,`customerID`,`productID`)VALUES(" + queryObj.wishlistID + "," + queryObj.customerID + "," + queryObj.productID + ");";

    sequelize.query(sql).then((data) => {
        cb(data);
    });
};