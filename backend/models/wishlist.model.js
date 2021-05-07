const Sequelize = require('sequelize');
const sequelize = require('./connection');

const Wishlist = sequelize.define('Wishlist', {
    customerID: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey : true
    },
    productID: {
        type: Sequelize.INTEGER,
        allowNull: false,
        primaryKey : true
    }
},{
    freezeTableName : true,
    timestamps : false
})

//Wishlist.removeAttribute('id');

module.exports = Wishlist;