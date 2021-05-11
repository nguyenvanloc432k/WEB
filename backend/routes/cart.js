
var express = require('express');
const router = express.Router();
var cart = require('../controller/cart.controller');

router.get('/:customerID', cart.getAllByUser);
router.get('/count/:customerID', cart.countProduct);
router.post('/add', cart.addOneToCart);
router.post('/delete', cart.deleteOne);

module.exports = router;