import {test, expect} from "@playwright/test";

const BASE_URL = "http://localhost:3001";

test("Happy E2E Test - visit site and click login with pauses", async ({page}) => {
  // Visit the site
  await page.goto(BASE_URL + "/");

  // pause 1.5s
  await page.waitForTimeout(1500);

  // Find and click the login button
  await page.click("#optLogin > a");

  // pause 1.5s
  await page.waitForTimeout(1500);

  // Optionally, check login page loaded
  await expect(page).toHaveURL(/login/);
});
