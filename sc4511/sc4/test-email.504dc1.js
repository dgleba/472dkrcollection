
require('dotenv').config()

var nodemailer = require('nodemailer');
// var smtpTransport = require('nodemailer-smtp-transport');


// Current...


// 504dc
// 
// https://nodemailer.com/smtp/
// secure – if true the connection will use TLS when connecting to server. If false (the default) then TLS is used if server supports the STARTTLS extension. In most cases set this value to true if you are connecting to port 465. For port 587 or 25 keep it false.
//
var transporter = nodemailer.createTransport({
  host: "172.27.0.7", // hostname
  secure: false, // TLS requires secureConnection to be false
  port: 25 // port for secure SMTP
});



// #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
// #@  
// #@  works.
// #@  
// #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2020-03-03[Mar-Tue]12-46PM 

// 2020-03-03 12:20PM works.
// 
// Must be from hotmail account. See below - var mailOptions ...
//
// var transporter = nodemailer.createTransport({
  // host: "smtp-mail.outlook.com", // hostname
  // secureConnection: false, // TLS requires secureConnection to be false
  // port: 587, // port for secure SMTP
  // tls: {
    // ciphers: 'SSLv3'
  // },
  // auth: {
    // user: process.env.ev_hotemail,
    // pass: process.env.ev_hotpass
  // }
// });



// other trys..

// var smtpTransport = nodemailer.createTransport(smtpTransport({
//   service: 'Hotmail',
//   auth: {
//     user: process.env.ev_hotemail,
//     pass: process.env.ev_hotpass
//   }
// }));


// var transporter = nodemailer.createTransport({
//   service: "Hotmail"{
//   host: "smtp-mail.outlook.com",
//   port: 587,
//   requiresAuth: true,
//   domains: ["hotmail.com", "outlook.com"],
//   tls: { ciphers: 'SSLv3' }
// },
// });


// var transport = nodemailer.createTransport("SMTP", {
// host: "smtp-mail.outlook.com",
// secureConnection: false, 
// port: 587, 
// auth: {
// user: "davidgleba@hotmail.com",
// pass: "x"
// },
// tls: {
// ciphers:'SSLv3'
// }
// });


// const transporter = nodemailer.createTransport({
// host: 'smtp-mail.outlook.com',
// service:'smtp-mail.outlook.com',
// port: 587,
// secure: false,  //true for 465 port, false for other ports
// auth: {
// user: 'davidgleba@hotmail.com',
// pass: 'x'
// },      
// secureConnection: false,
// tls: {
// ciphers: 'SSLv3',
// rejectUnauthorized: true
// }
// });    


// nodemailer.createTransport({
//   host: "MESG01",
//   secure: false, // upgrade later with STARTTLS
// });


var mailOptions = {
  from: 'j@jgleba.com',
  to: 'dgleba@gmail.com',
  subject: 'Sending Email using Node.js',
  text: 'That was not easy! 09:01AM'
};
transporter.sendMail(mailOptions, function (error, info) {
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});


