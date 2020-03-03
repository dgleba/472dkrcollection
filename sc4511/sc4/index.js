
const puppeteer = require('puppeteer');
const dayjs = require('dayjs');

// handle promise errors globally..
// https://stackoverflow.com/questions/31472439/catch-all-unhandled-javascript-promise-rejections
process.on('unhandledRejection', function(err, promise) {
    console.error('Unhandled rejection (promise: ', promise, ', reason: ', err, ').');
    return process.exit(1);
    // dgleba_make_error_to_exit();
});

(async () => {
  const url = 'https://sc4.edu/campus-life/college-housing/college-housing-application/';
  const text = '2020-2021';
  const browser = await puppeteer.launch( {args: ['--no-sandbox', '--disable-setuid-sandbox']} );
  const page = await browser.newPage();
  await page.goto(url);

  try {
    await page.waitForFunction(
      text => document.querySelector('body').innerText.includes(text),
      {},
      text
    );
    console.log("text found");
    await page.screenshot({path: '/app/output/pagefound.png', fullPage:true});
  } catch(e) {
    console.log(`The text "${text}" was not found on the page`);
    await page.screenshot({path: '/app/output/page-textnotfound.png', fullPage:true});
  }

  
  await browser.close();
})();
