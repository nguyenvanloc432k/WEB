
var express = require('express');
const router = express.Router();
var wishlist = require('../controller/wishlist.controller');

router.get('/:customerID', wishlist.getAllByUser);
router.post('/add', wishlist.addOneToWishlist);
router.post('/delete', wishlist.deleteOne);

module.exports = router;