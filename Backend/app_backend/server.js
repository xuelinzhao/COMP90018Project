// include packges
var express = require('express');
app = express();

var mongoose = require('mongoose');

var bodyParser = require('body-parser');
var morgan = require('morgan');
var passport = require('passport');
var jwt = require('jsonwebtoken');

var nodemailer = require('nodemailer');

// var config = require(./config/main);

var port = 3000;


// use body-parser to get POST request for API use 
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Log requests to console
app.use(morgan('dev'));

// Initialize passport  
app.use(passport.initialize());

// connect to database
// mongoose.connect(config.database);

// Home route 
app.get('/', function(req, res) {
  res.send('This is home route');
});


var apiRoutes = express.Router();

apiRoutes.post('/sendEmail', function(req, res){
	var message = req.body.message;
	var contact = req.body.contact;

	var transporter = nodemailer.createTransport({
  		service: 'gmail',
  		auth: {
    	user: '91safecare@gmail.com',
    	pass: 'safe1234'
  		}
  	});

  	var mailOptions = {
  		from: '91safecare@gmail.com',
  		to: 'xiong1@student.unimelb.edu.au',
  		subject: 'Sending Email using Node.js',
  		text: 'testing'
	};


	transporter.sendMail(mailOptions, function(error, info){
  		if (error) {
    		console.log(error);
  		} else {
    		console.log('Email sent: ' + info.response);
  		}
	});

});


app.use('/api',apiRoutes);

app.listen(port);
console.log(' Server is running on port '+ port +'.');


