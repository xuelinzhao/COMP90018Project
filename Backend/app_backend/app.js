// ----------------------------------------------------------------------------
// Copyright (c) 2015 Microsoft Corporation. All rights reserved.
// ----------------------------------------------------------------------------

// This is a base-level Azure Mobile App SDK.
var express = require('express'),
    azureMobileApps = require('azure-mobile-apps');

// Set up a standard Express app
var app = express();

// If you are producing a combined Web + Mobile app, then you should handle
// anything like logging, registering middleware, etc. here


var bodyParser = require('body-parser');
var nodemailer = require('nodemailer');
var apiRoutes = express.Router();

// use body-parser to get POST request for API use
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Configuration of the Azure Mobile Apps can be done via an object, the
// environment or an auxiliary file.  For more information, see
// http://azure.github.io/azure-mobile-apps-node/global.html#configuration
var mobileApp = azureMobileApps({
    // Explicitly enable the Azure Mobile Apps home page
    homePage: true,
    // Explicitly enable swagger support. UI support is enabled by
    // installing the swagger-ui npm module.
    swagger: true
});

// Import the files from the tables directory to configure the /tables endpoint
mobileApp.tables.import('./tables');

// Import the files from the api directory to configure the /api endpoint
mobileApp.api.import('./api');

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
  		to: contact,
  		subject: 'Sending Email using Node.js',
  		text: message
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

// Initialize the database before listening for incoming requests
// The tables.initialize() method does the initialization asynchronously
// and returns a Promise.
mobileApp.tables.initialize()
    .then(function () {
        app.use(mobileApp);    // Register the Azure Mobile Apps middleware
        app.listen(process.env.PORT || 3000);   // Listen for requests
    });
