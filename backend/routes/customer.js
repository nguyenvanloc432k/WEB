var express = require('express');
const router = express.Router();
var customer = require('../controller/customer.controller');

router.get('/', customer.getAll)
router.get('/:id',customer.getById);
router.post('/deleted/:id',customer.deleteCustomer);
router.post('/add', customer.postCustomer);
router.post('/update/:id',customer.updateCustomer)

module.exports = router;