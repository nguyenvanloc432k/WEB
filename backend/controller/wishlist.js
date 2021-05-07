var Wishlist = require('../services/wishlist');
var async = require('async');

exports.list = (req, res, next) => {
    var query = {};
    query.customerID = req.query.customerID;

    async.series({
        list: (cb) => {
            Wishlist.getWishlist(query, (rows) => {
                cb(null, rows[0])
            });
        }
    }, (err, ret) => {
        var data = {
            status: "success",
            list: ret.list
        };
        res.json(data);
    });
};

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