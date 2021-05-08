const Sequelize = require('sequelize')
const sequelize  = require('./connection')
const Product = sequelize.define('Product',{
    productID :{
        type : Sequelize.INTEGER,
        allowNull : false,
        autoIncrement : true,
        primaryKey : true,
    },
    cateID :{
        type : Sequelize.INTEGER,
        allowNull : false
    },
    productName :{
        type : Sequelize.STRING,
        allowNull : false
    },
    productPrice :{
        type : Sequelize.INTEGER,
        allowNull : false
    },
    productQuantity :{
        type : Sequelize.INTEGER,
    },
    productImg :{
        type : Sequelize.STRING(500),
    },
    productDescription :{
        type : Sequelize.STRING(8191),
    },
    brandID :{
        type : Sequelize.INTEGER,
        allowNull : false
    },
    productRAM :{
        type : Sequelize.INTEGER,
        allowNull : false
    },
    productSSD :{
        type : Sequelize.INTEGER,
        allowNull : false
    },
    productDisplay :{
        type : Sequelize.STRING(127),
        allowNull : false
    },
    productWeight :{
        type : Sequelize.DOUBLE,
    },
    productCPU :{
        type : Sequelize.STRING,
        allowNull : false
    },
},{
    freezeTableName : true,
    timestamps : false
})