const express = require('express');
const router = express.Router();

var controller = require('../controller/brand.controller');


router.get("/",controller.getAll);
router.get('/:id',controller.getById);
router.post('/create',controller.postBrand)
router.post('/update/:id',controller.updateBrand)

module.exports = router;