import {Builder, By, until, Key} from "selenium-webdriver";

const BASE_URL = "http://localhost:3001";

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

(async function happyE2ETest() {
  let driver = await new Builder().forBrowser("chrome").build();

  try {
    await driver.get(BASE_URL);

    await signUp(driver);

    await login(driver);

    await addUnitToCart(driver, "Mens Casual Premium Slim Fit T-Shirts");

    await addUnitToCart(driver, "SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s", 2);

    await openCart(driver);

    await fillCheckoutForm(driver);

    await driver.findElement(By.css(".utility #optLogout a")).click();

    await sleep(1_000);

    const loginLink = await driver.wait(until.elementLocated(By.css(".utility #optLogin a")), 1500);
    await driver.wait(until.elementIsVisible(loginLink), 1500);
  } finally {
    await driver.quit();
  }
})();

async function fillCredentials(driver, email = "lmadsen@mail.com", pwd = "pepe", shouldRepeatPsw = false) {
  // EMAIL
  const emailField = await driver.findElement(By.id('txtEmail'));
  emailField.sendKeys(email)

  await sleep(250);

  // PASSWORD
  const passwordField = await driver.findElement(By.id('txtPassword'));
  passwordField.sendKeys(pwd);

  await sleep(250);

  if (shouldRepeatPsw) {
    // REPEAT_PASSWORD
    const repeatPasswordField = await driver.findElement(By.id('txtRepeatPassword'));
    repeatPasswordField.sendKeys(pwd);

    await sleep(250);
  }
}

async function signUp(driver) {
  await driver.wait(until.elementLocated(By.css("#optSignup > a"))).click();

  await fillCredentials(driver, "test@kea.dk", "Testing", true);

  // SIGNUP
  await driver.findElement(By.css("#frmSignup input[type='submit']")).click();

  await sleep(500);

  // CLOSE USER EXISTS ALERT
  await driver.findElement(By.css('button[title="Close Alert"]')).click();
}

async function login(driver) {
  await driver.findElement(By.xpath('//a[text()="log in"]')).click();

  await sleep(500);

  await fillCredentials(driver);

  // LOGIN
  await driver.findElement(By.css("#frmLogin input[type='submit']")).click();

  await sleep(1_000);
}


async function addUnitToCart(driver, title, increment = 0) {
  const articles = await driver.findElements(By.css("article"), 1_500);

  for (let article of articles) {
    const h2 = await article.findElement(By.css("header h2"));
    const articleTitle = await h2.getText();

    if (articleTitle === title) {
      await driver.executeScript("arguments[0].scrollIntoView({behavior: 'smooth', block: 'center'});", article);

      if (increment > 0) {
        const qtyInput = await article.findElement(By.css("div.cart input[type='number']"));

        for (let i = 1; i < increment; i++) {
          await qtyInput.sendKeys(Key.ARROW_UP);
          await sleep(200);
        }
      }

      const addButton = await article.findElement(By.css("div.cart button"));
      await addButton.click();

      await sleep(500);
      break;
    }
  }

  await sleep(1_000);
}

async function openCart(driver) {
  await driver.executeScript("window.scrollTo({ top: 0, behavior: 'smooth' });");

  await sleep(500);

  await driver.findElement(By.xpath('//a[text()="Cart"]')).click();

  await sleep(500);

  const sandiskRow = await driver.findElement(
    By.xpath('//tr[td[@class="titleCell" and text()="SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s"]]')
  );

  const qtyInput = await sandiskRow.findElement(By.css('td.amountCell input[type="number"]'));
  await qtyInput.sendKeys(Key.ARROW_UP);

  await sleep(500);

  await driver.findElement(By.css("#cart .submit input[type='submit']")).click();

  await sleep(500);
}

async function fillCheckoutForm(driver) {
  // ADDRESS
  const addressField = await driver.findElement(By.css("#checkout #delivery #txtDeliveryAddress"));
  addressField.sendKeys("Guldbergsgade 29N");

  await sleep(500);

  // // POSTAL_CODE
  const postalCodeField = await driver.findElement(By.css("#checkout #delivery #txtDeliveryPostalCode"));
  postalCodeField.sendKeys("2200");

  await sleep(500);

  // CITY
  const cityField = await driver.findElement(By.css("#checkout #delivery #txtDeliveryCity"));
  cityField.sendKeys("Copenhagen");

  await sleep(500);

  // CHECK same as delivery box
  await driver.findElement(By.css("#checkout #billing #chkRepeat")).click();

  await sleep(500);

  // CREDIT_CARD_NAME
  const nameField = await driver.findElement(By.css("#checkout #payment #txtCreditCardName"));
  nameField.sendKeys("Pernille L. Hansen");

  await sleep(500);

  // EXPIRATION_FIELD
  const expirationField = await driver.findElement(By.css("#checkout #payment #txtExpiryDate"));
  await driver.executeScript("arguments[0].value = '2027-12';", expirationField);

  await sleep(500);

  // CVV
  const cvvField = await driver.findElement(By.css("#checkout #payment #txtCVV"));
  cvvField.sendKeys("666");

  await sleep(500);

  // CHECKOUT
  await driver.findElement(By.css("#checkout .submit input")).click();

  await sleep(500);

  // ENSURE CART IS EMPTY
  await driver.findElement(By.xpath('//a[text()="Cart"]')).click();

  const alertText = await driver.findElement(By.css("#alert p")).getText();

  if (alertText === "The cart is empty. Please add some products to the cart.") {
    console.log("Cart is empty ✅");
  } else {
    console.log("Cart is NOT empty ❌");
  }

  await sleep(500);

  await driver.findElement(By.css("#alert button")).click();

  await sleep(1_000);
}
