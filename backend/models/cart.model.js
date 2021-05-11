const Sequelize = require('sequelize');
const sequelize = require('./connection');

//let Customer = require('./customer.model');
let Product = require('./product.model');
let CartProduct = require('./cart_product.model');

const Cart = sequelize.define('Cart', {
    customerID : {
        type : Sequelize.INTEGER,
        allowNull : false,
        primaryKey : true
    },
    productID : {
        type : Sequelize.INTEGER,
        allowNull : false,
        primaryKey : true,
    },
},{
    freezeTableName : true,
    timestamps : false
});

module.exports = Cart;