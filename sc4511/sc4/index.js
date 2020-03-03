
const puppeteer = require('puppeteer');
const dayjs = require('dayjs');
require('dotenv').config()

// mail..
//
var nodemailer = require('nodemailer');
// var smtpTransport = require('nodemailer-smtp-transport');

var transporter = nodemailer.createTransport({
  host: "smtp-mail.outlook.com", // hostname
  secureConnection: false, // TLS requires secureConnection to be false
  port: 587, // port for secure SMTP
  tls: {
    ciphers: 'SSLv3'
  },
  auth: {
    user: process.env.ev_hotemail,
    pass: process.env.ev_hotpass
  }
});


// handle promise errors globally..
// https://stackoverflow.com/questions/31472439/catch-all-unhandled-javascript-promise-rejections
//
process.on('unhandledRejection', function (err, promise) {
  console.error('Unhandled rejection (promise: ', promise, ', reason: ', err, ').');
  return process.exit(1);
  // dgleba_make_error_to_exit();
});


//  look for.. 2020-2021

(async () => {
  const url = 'https://sc4.edu/campus-life/college-housing/college-housing-application/';
  const text = '2020-2021';
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  await page.goto(url);

  try {
    await page.waitForFunction(
      text => document.querySelector('body').innerText.includes(text),
      {},
      text
    );
    console.log("SUCCESS ------------------- text found. Check the page your self now.");
    
    var mailOptions = {
      from: 'davidgleba@hotmail.com',
      to: 'dgleba@gmail.com',
      subject: '-- SUCCESS -- new application found',
      text: 'The text 2020-2021 was found, so you should visit the page yourself and see it is true.'
    };
    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        console.log(error);
      } else {
        console.log('Email sent: ' + info.response);
      }
    });     
    
    await page.screenshot({ path: '/app/output/pagefound.png', fullPage: true });
  } catch (e) {
    console.log(`error.. The text "${text}" was NOT NOT NOT on the page`);

    var mailOptions = {
      from: 'davidgleba@hotmail.com',
      to: 'dgleba@gmail.com,dgleba@stackpole.com,ckeller@london.ca',
      subject: 'error - sc4 housing new application NOT found',
      text: 'the text `2020-2021` was NOT there'
    };
    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        console.log(error);
      } else {
        console.log('Email sent: ' + info.response);
      }
    });    
    // await page.screenshot({path: '/app/output/page-textnotfound.png', fullPage:true});
  }


  await browser.close();
})();



(async () => {
  const url = 'https://sc4.edu/campus-life/college-housing/college-housing-application/';
  const text = '2021';
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  await page.goto(url);

  try {
    await page.waitForFunction(
      text => document.querySelector('body').innerText.includes(text),
      {},
      text
    );
    console.log("SUCCESS ------------------- text found. Check the page your self now.");
    
    var mailOptions = {
      from: 'davidgleba@hotmail.com',
      to: 'dgleba@gmail.com',
      subject: '-- SUCCESS -- new application found',
      text: 'The text 2021 was found, so you should visit the page yourself and see it is true.'
    };
    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        console.log(error);
      } else {
        console.log('Email sent: ' + info.response);
      }
    });
    
    await page.screenshot({ path: '/app/output/pagefound2021.png', fullPage: true });
  } catch (e) {
    console.log(`error.. The text "${text}" was NOT NOT NOT on the page`);
    // await page.screenshot({path: '/app/output/page-textnotfound.png', fullPage:true});
  }


  await browser.close();
})();

