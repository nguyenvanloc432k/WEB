const express = require('express');
var bodyParser = require('body-parser');
let multer = require('multer');
const cors = require('cors');

var Product = require('./routes/product');
var Wishlist = require('./routes/wishlist');
var Cart = require('./routes/cart');
var Brand = require('./routes/brand')
var Customer = require('./routes/customer')
var Order = require('./routes/order')

var app = express();
let upload = new multer()

//for parsing application/json
app.use(bodyParser.json());

//for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'))

app.use(cors());

// router
app.use('/products',Product);
// for parsing multipart/form-data
app.use(upload.array())
app.use('/wishlist', Wishlist);
app.use('/brand',Brand)
app.use('/cart', Cart);
app.use('/customer',Customer)
app.use('/order',Order)

const port = process.env.PORT || 4000 // export PORT = 4000
app.listen(port,()=>{
    console.log(`Listening on port ${port}....`);
})