const Sequelize = require('sequelize');
const sequelize = require('./connection');

const Customer = sequelize.define('Customer',{
    customerID :{
        type : Sequelize.INTEGER,
        allowNull : false,
        autoIncrement : true,
        primaryKey : true,
    },
    customerName :{
        type : Sequelize.STRING,
        allowNull : false,
    },
    address :{
        type : Sequelize.STRING,
    },
    city :{
        type : Sequelize.STRING,
    },
    country :{
        type : Sequelize.STRING,
    },
    phone :{
        type : Sequelize.STRING,
    },
    email :{
        type : Sequelize.STRING,
        primaryKey : true,
        allowNull : false,
    },
    password :{
        type : Sequelize.STRING,
        allowNull :false,
    }
},{
    freezeTableName : true,
    timestamps : false
})

module.exports = Customer;