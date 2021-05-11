const Sequelize = require('sequelize');
const sequelize = require('./connection');

const CartProduct = sequelize.define('CartProduct', {
    cartID : {
        type : Sequelize.INTEGER,
        allowNull : false,
        primaryKey : true
    },
    productID : {
        type : Sequelize.INTEGER,
        allowNull : false,
        primaryKey : true
    }
},{
    freezeTableName : true,
    timestamps : false
})


module.exports = CartProduct;