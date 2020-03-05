
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
//   checkum application page
//
(async () => {
  const url = 'https://sc4.edu/campus-life/college-housing/college-housing-application/';
  const text = '2021';
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
    // screenshot..
    // await page.screenshot({ path: '/app/output/pagefoundb.png', fullPage: true });
	
  } catch (e) {
    console.log(`error.. The text "${text}" was NOT NOT NOT on the page`);
    // await page.screenshot({path: '/app/output/page-textnotfound.png', fullPage:true});
  }
  await browser.close();
})();


// =================================================



const fs = require("fs");

async function run() {
	// const browser = await puppeteer.launch();
	// const page = await browser.newPage();
	const url = 'https://sc4.edu/campus-life/college-housing/college-housing-application/';
	const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
	const page = await browser.newPage();
	await page.goto(url);
	await page.goto(url, { waitUntil: "networkidle2" });
	// hacky defensive move but I don't know a better way:
	// wait a bit so that the browser finishes executing JavaScript
	await page.waitFor(1 * 1000);
	const html = await page.content();
	fs.writeFileSync("/app/output/housingapplication.html", html);
	await browser.close();
	// compare to last version
	// must have /app/output/housingapplication-last.html present
	return html;
}


var vpage1='';
var vpage;
var vcmp;

vpage = run();
vpage1 = vpage;
vcmp = vpage1.localeCompare(vpage);
console.log(`vpage "${vpage}"`);
console.log(`-zz0-----------------------------------`);
console.log(`vcmp "${vcmp}"`);

// vcmp = vpage1.localeCompare(vpage);
console.log(`vpage "${vpage}"`);
console.log(`-zz2-----------------------------------`);
console.log(`vcmp "${vcmp}"`);







