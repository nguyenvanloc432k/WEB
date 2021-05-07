const express = require('express');
var bodyParser = require('body-parser');
var Product = require('./routes/product');
var Wishlist = require('./routes/wishlist');
const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static('public'))
app.use('/products',Product);
app.use('/wishlist', Wishlist);

const port = process.env.PORT || 4000 // export PORT = 4000
app.listen(port,()=>{
    console.log(`Listening on port ${port}....`);
})