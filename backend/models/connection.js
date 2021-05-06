const {Sequelize} = require('sequelize');
const db = require('../config/db.config');
const sequelize = new Sequelize({
    database: db.DB,
    username : db.USER,
    password :db.PASSWORD,
    host : db.HOST,
    dialect : 'mysql'
})

module.exports = sequelize;