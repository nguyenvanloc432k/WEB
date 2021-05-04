var Sequelize = require('sequelize');
var sequelize = require('../database/db');

var Wishlist = sequelize.define('wishlist', {
    wishlistID: {
        type: Sequelize.BIGINT(11),
        allowNull: false
    },
    customerID: {
        type: Sequelize.BIGINT(11),
        allowNull: false
    },
    productID: {
        type: Sequelize.BIGINT(11),
        allowNull: false
    }
});


module.exports = Wishlist;