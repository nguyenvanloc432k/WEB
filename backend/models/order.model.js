const Sequelize = require('sequelize');
const sequelize = require('./connection');

const Order = sequelize.define('Order',{
    orderID :{
        type : Sequelize.INTEGER,
        allowNull : false,
        primaryKey : true,
    },
    dateOrder :{
        type : Sequelize.DATE,
    },
    orderStatus :{
        type : Sequelize.STRING,
    },
    customerID :{
        type : Sequelize.INTEGER,
        allowNull : false,
    },
    number :{
        type : Sequelize.INTEGER,
    },
},{
        freezeTableName : true,
        timestamps : false
    }
)
module.exports = Order;