
var express = require('express');
var router = express.Router();
var wishlist = require('../controller/wishlist');

router.get('/:customerID', wishlist.getAllByUser);
router.post('/add', wishlist.add);
router.post('/delete', wishlist.delete);

module.exports = router;