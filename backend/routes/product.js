const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path')
var controller = require('../controller/product.controller');

var storage = multer.diskStorage({
    destination: './public/images',

    filename: function(req, file, callback) {
        var fname = Date.now() + path.extname(file.originalname);
        callback(null, fname);
    }
});
var upload = multer({
    storage : storage
});
router.get("/",controller.getAll);
router.get('/filter',controller.filter);
router.get('/:id',controller.getById);

router.post('/deleted/:id',controller.deleteProduct);
router.post('/create',upload.array("productImg",12),controller.postProduct)
router.post('/update/:id',upload.array("productImg",12),controller.updateProduct)
module.exports = router;