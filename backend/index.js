const express = require('express');
var bodyParser = require('body-parser');
var Product = require('./routes/product')
const app = express();

app.use(bodyParser.json());
app.use(express.static('public'))
app.use('/products',Product);

const port = process.env.PORT || 4000 // export PORT = 4000
app.listen(port,()=>{
    console.log(`Listening on port ${port}....`);
})