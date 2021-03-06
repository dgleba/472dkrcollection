
const puppeteer = require('puppeteer');
const dayjs = require('dayjs');
require('dotenv').config();

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


// 1.
//   look for.. 2020-2021
//
(async () => {
  const url = 'https://sc4.edu/campus-life/college-housing/college-housing-application/';
  const text = '2020-2021';
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  await page.goto(url);
  //
  try {
    await page.waitForFunction(
      text => document.querySelector('body').innerText.includes(text),
      {},
      text
    );
    console.log("SUCCESS ------------------- text found. Check the page your self now.");
    //mail it..  
    var mailOptions = {
      from: 'davidgleba@hotmail.com',
      to: 'dgleba@gmail.com,dgleba@stackpole.com,ckeller@london.ca,ke.seguin@icloud.com',
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
    // screenshot..
    await page.screenshot({ path: '/app/output/pagefound.png', fullPage: true });
  } catch (e) {
    console.log(`error.. The text "${text}" was NOT NOT NOT on the page`);
    // mail..
    var mailOptions = {
      from: 'davidgleba@hotmail.com',
      to: 'dgleba@gmail.com',
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


// 2.
//   look for.. 2021
//
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
      to: 'dgleba@gmail.com,dgleba@stackpole.com,ckeller@london.ca,ke.seguin@icloud.com',
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



// 3.
//   look for.. 2019 on howtoapply, if not present. send success email
//
(async () => {
  const url = 'https://sc4.edu/campus-life/college-housing/how-to-apply/';
  const text = '2019';
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  await page.goto(url);
  //
  try {
    await page.waitForFunction(
      text => document.querySelector('body').innerText.includes(text),
      {},
      text
    );
    console.log(`error.. The text "${ text }" was there on the page. So its an old page.`);
    // mail..
    var mailOptions = {
      from: 'davidgleba@hotmail.com',
      to: 'dgleba@gmail.com',
      subject: 'error.. 2019 was there on the page. So its an old page.',
      text: 'error'
    };
    // transporter.sendMail(mailOptions, function (error, info) {
      // if (error) {
        // console.log(error);
      // } else {
        // console.log('Email sent: ' + info.response);
      // }
    // });
    //
    //await page.screenshot({ path: '/app/output/pagenotfound2.png', fullPage: true });
  } catch (e) {
    console.log(`SUCCESS -- 2019 was not found. `);
    //
    var mailOptions = {
      from: 'davidgleba@hotmail.com',
      to: 'dgleba@gmail.com,dgleba@stackpole.com,ckeller@london.ca,ke.seguin@icloud.com',
      subject: '-- SUCCESS -- new application found',
      text: '2019 was not found. Check the page yourself to see if it is true. https://sc4.edu/campus-life/college-housing/how-to-apply/'
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



// 4.
//   look for.. 2019 on howtoapply, if not present. send success email
//
(async () => {
  const url = 'https://sc4.edu/campus-life/college-housing/college-housing-application/';
  const text = '2019';
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  await page.goto(url);
  //
  try {
    await page.waitForFunction(
      text => document.querySelector('body').innerText.includes(text),
      {},
      text
    );
    console.log(`error.. The text "${ text }" was there on the page. So its an old page.`);
    var mailOptions = {
      from: 'davidgleba@hotmail.com',
      to: 'dgleba@gmail.com',
      subject: 'error.. The text "${ text }" was there on the page. So its an old page.',
      text: 'error'
    };
    // transporter.sendMail(mailOptions, function (error, info) {
      // if (error) {
        // console.log(error);
      // } else {
        // console.log('Email sent: ' + info.response);
      // }
    // });
    // await page.screenshot({ path: '/app/output/pagefound.png', fullPage: true });
  } catch (e) {
    console.log(`SUCCESS -- 2019 was not found. `);
    //
    var mailOptions = {
      from: 'davidgleba@hotmail.com',
      to: 'dgleba@gmail.com,dgleba@stackpole.com,ckeller@london.ca,ke.seguin@icloud.com',
      subject: '-- SUCCESS -- new application found',
      text: 'Check the page yourself to see if it is true. https://sc4.edu/campus-life/college-housing/college-housing-application/'
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


