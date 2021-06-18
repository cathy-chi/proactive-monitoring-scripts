const synthetics = require("Synthetics");
const log = require("SyntheticsLogger");

const loginAndPassword = async function () {
  synthetics.setLogLevel(process.env.logLevel);

  const redirectUrl = "https://tryfinch.com";
  const provider = process.env.provider;
  const apiUrl =
  "https://connect.tryfinch.com/authorize?%20&client_id=3898b9a4-898e-4b82-8abc-a5d719c56bf9%20&products=company%20directory%20&redirect_uri=https://tryfinch.com&sandbox=true&sandbox=true&payroll_provider=" +
      provider;
  const page = await synthetics.getPage();
  await page.goto(apiUrl);
  await page.click("[type=submit]");
  await page.click("[type=submit]");
  await page.type("#username", process.env.email);
  await page.type("#password", process.env.password);
  await page.click("button");
  try {
    await page.waitForNavigation({ waitUntil: "load" });
  } catch (err) {
    log.error("Redirect failed due to " + JSON.stringify(err), err.stack);
    throw err;
  }
  const url = await page.url();
  if (url.startsWith(redirectUrl)) {
    log.info("The URL " + url + " matches the redirect URL " + redirectUrl);
  } else {
    log.error("The URL " + url + " is not a valid redirect URL.");
    throw "Invalid redict URL!";
  }
};

exports.handler = async () => {
  return await loginAndPassword();
};
