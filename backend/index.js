const express = require('express');
const app = express()
const bodyParser = require('body-parser')
require('dotenv').config()
const port = process.env.PORT || 3000;

var wishlist = require('./routes/wishlist');

app.use(bodyParser.urlencoded({ extended: true}))
app.use(bodyParser.json())

app.use('/', wishlist);

app.use(function(req, res, next) {
	var err = new Error('Not Found');
	err.status = 404;
	next(err);
});

app.use(function(err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get('env') === 'development' ? err : {};

	// render the error page
	res.status(err.status || 500);
	res.render('error');
});


app.listen(port);
console.log('RESTful API server started on: ' + port);