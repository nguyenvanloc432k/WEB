
var express = require('express');
var router = express.Router();
var wishlist = require('../controller/wishlist');

router.get('/wishlist?', wishlist.list);
router.post('/wishlist/add', wishlist.add);

module.exports = router;