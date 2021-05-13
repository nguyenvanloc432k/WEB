var express = require('express');
const router = express.Router();
var order = require('../controller/order.controller');

router.get('/', order.getAll)
router.get('/:id',order.getById);
router.post('/deleted/:id',order.deleteOrder);
router.post('/add', order.postOrder);
router.post('/update/:id',order.updateOrder)

module.exports = router;