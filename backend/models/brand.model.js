const Sequelize = require('sequelize')
const sequelize  = require('./connection')
const Brand = sequelize.define('Brand',{
    brandID :{
        type : Sequelize.INTEGER,
        allowNull : false,
        autoIncrement : true,
        primaryKey : true,
    },
    brandName:{
        type : Sequelize.STRING(63),
        allowNull:false
    }
},{
    freezeTableName : true,
    timestamps : false
})
module.exports = Brand;