const express = require('express');
var bodyParser = require('body-parser');
let multer = require('multer');
var Product = require('./routes/product');
var Wishlist = require('./routes/wishlist');
var Brand = require('./routes/brand')

var app = express();
let upload = new multer()

//for parsing application/json
app.use(bodyParser.json());

//for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'))


// router
app.use('/products',Product);
// for parsing multipart/form-data
app.use(upload.array())
app.use('/wishlist', Wishlist);
app.use('/brand',Brand)

const port = process.env.PORT || 4000 // export PORT = 4000
app.listen(port,()=>{
    console.log(`Listening on port ${port}....`);
})