// cypress/e2e/happyLogin.cy.js

describe("Happy E2E Test", () => {
  it("visits site and clicks login with pauses", () => {
    cy.visit("/");

    // pause 1.5s
    cy.wait(1500);

    // find and click login button
    cy.get("#optLogin > a").click();

    // pause 1.5s
    cy.wait(1500);

    // optionally, check login page loaded
    cy.url().should("include", "login");
  });
});
