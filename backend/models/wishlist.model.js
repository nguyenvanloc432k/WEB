const Sequelize = require('sequelize');
const sequelize = require('./connection');

const Wishlist = sequelize.define('Wishlist', {
    wishlistID :{
        type : Sequelize.INTEGER,
        allowNull: false
    },
    customerID: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    productID: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
},{
    freezeTableName : true,
    timestamps : false
})
module.exports = Wishlist;