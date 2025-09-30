import {test, expect} from "@playwright/test";


test.describe("Happy E2E Test", () => {

  async function fillCredentials(page, email = "lmadsen@mail.com", pwd = "pepe", shouldRepeat = false) {
    await page.fill("#txtEmail", email);
    await page.waitForTimeout(250);

    await page.fill("#txtPassword", pwd);
    await page.waitForTimeout(250);

    if (shouldRepeat) {
      await page.fill("#txtRepeatPassword", pwd);
      await page.waitForTimeout(250);
    }
  }

  async function signUp(page) {
    await page.click("#optSignup a");
    await fillCredentials(page, "test@kea.dk", "Testing", true);

    await page.click("#frmSignup input[type='submit']");
    await page.waitForTimeout(500);

    // Close alert if user exists
    const alertBtn = page.locator("#alert button");
    if (await alertBtn.isVisible()) {
      await alertBtn.click();
    }
  }

  async function login(page) {
    await page.getByRole("link", {name: /log in/i}).click();
    await page.waitForTimeout(500);

    await fillCredentials(page);
    await page.click("#frmLogin input[type='submit']");
    await page.waitForTimeout(1000);
  }

  async function addUnitToCart(page, title, increment = 0) {
    const article = page.locator("article").filter({hasText: title});

    if (increment > 0) {
      for (let i = 1; i < increment; i++) {
        await article.locator("div.cart input[type='number']").press("ArrowUp");
        await page.waitForTimeout(200);
      }
    }
    await article.locator("div.cart button").click();
    await page.waitForTimeout(1000);
  }

  async function openCart(page) {
    await page.evaluate(() => window.scrollTo({top: 0, behavior: "smooth"}));
    await page.click(".utility #optCart a");
    await page.waitForTimeout(500);

    const sandiskRow = page.locator("tr", {hasText: "SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s"});
    await sandiskRow.locator('td.amountCell input[type="number"]').press("ArrowUp");

    await page.click("#cart .submit input[type='submit']");
    await page.waitForTimeout(500);
  }

  async function fillCheckoutForm(page) {
    await page.fill("#checkout #delivery #txtDeliveryAddress", "Guldbergsgade 29N");
    await page.waitForTimeout(500);

    await page.fill("#checkout #delivery #txtDeliveryPostalCode", "2200");
    await page.waitForTimeout(500);

    await page.fill("#checkout #delivery #txtDeliveryCity", "Copenhagen");
    await page.waitForTimeout(500);

    await page.check("#checkout #billing #chkRepeat");
    await page.waitForTimeout(500);

    await page.fill("#checkout #payment #txtCreditCardName", "Pernille L. Hansen");
    await page.waitForTimeout(500);

    // expiry (type="month") input
    await page.locator("#checkout #payment #txtExpiryDate").evaluate(el => el.value = "2027-12");
    await page.waitForTimeout(500);

    await page.fill("#checkout #payment #txtCVV", "666");
    await page.waitForTimeout(500);

    await page.click("#checkout .submit input");
    await page.waitForTimeout(500);

    // Ensure cart is empty
    await page.getByRole("link", {name: "Cart"}).click();
    await expect(page.locator("#alert p")).toContainText("The cart is empty. Please add some products to the cart.");
    await page.waitForTimeout(500);

    await page.click("#alert button");
    await page.waitForTimeout(1000);
  }

  test("runs the full happy E2E flow", async ({page}) => {
    await page.goto("/");

    await signUp(page);
    await login(page);
    await addUnitToCart(page, "Mens Casual Premium Slim Fit T-Shirts");
    await addUnitToCart(page, "SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s", 2);
    await openCart(page);
    await fillCheckoutForm(page);

    await page.click(".utility #optLogout a");
    await page.waitForTimeout(1000);

    await expect(page.locator(".utility #optLogin a")).toBeVisible();
  });
});