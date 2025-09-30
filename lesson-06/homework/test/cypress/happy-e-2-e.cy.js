// cypress/e2e/happyLogin.cy.js

describe("Happy E2E Test", () => {

  function fillCredentials(email = "lmadsen@mail.com", pwd = "pepe", shouldRepeat = false) {
    cy.get("#txtEmail").type(email);
    cy.wait(250);

    cy.get("#txtPassword").type(pwd);
    cy.wait(250);

    if (shouldRepeat) {
      cy.get("#txtRepeatPassword").type(pwd);
      cy.wait(250);
    }
  }

  function signUp() {
    cy.get("#optSignup a").click();
    fillCredentials("test@kea.dk", "Testing", true);

    cy.get("#frmSignup input[type='submit']").click();
    cy.wait(500);

    // Close alert if user exists
    cy.get('#alert button').click();
  }


  function login() {
    cy.contains('a', /log in/i).click();
    cy.wait(500);

    fillCredentials();
    cy.get("#frmLogin input[type='submit']").click();

    cy.wait(1000);
  }

  function addUnitToCart(title, increment = 0) {
    cy.get("article").contains("header h2", title).parents("article").within(() => {
      if (increment > 0) {
        for (let i = 1; i < increment; i++) {
          cy.get("div.cart input[type='number']").type("{uparrow}");
          cy.wait(200);
        }
      }
      cy.get("div.cart button").click();
    });
    cy.wait(1000);
  }

  function openCart() {
    cy.scrollTo("top");
    cy.get(".utility #optCart a").click();
    cy.wait(500);

    // Find the row with SanDisk SSD
    cy.contains("tr", "SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s").within(() => {
      cy.get('td.amountCell input[type="number"]').type("{uparrow}");
    });

    cy.get("#cart .submit input[type='submit']").click();
    cy.wait(500);
  }

  function fillCheckoutForm() {
    cy.get("#checkout #delivery #txtDeliveryAddress").type("Guldbergsgade 29N");
    cy.wait(500);

    cy.get("#checkout #delivery #txtDeliveryPostalCode").type("2200");
    cy.wait(500);

    cy.get("#checkout #delivery #txtDeliveryCity").type("Copenhagen");
    cy.wait(500);

    cy.get("#checkout #billing #chkRepeat").check();
    cy.wait(500);

    cy.get("#checkout #payment #txtCreditCardName").type("Pernille L. Hansen");
    cy.wait(500);

    // Expiry (type="month") must be yyyy-MM
    cy.get("#checkout #payment #txtExpiryDate").invoke("val", "2027-12").trigger("change");
    cy.wait(500);

    cy.get("#checkout #payment #txtCVV").type("666");
    cy.wait(500);

    cy.get("#checkout .submit input").click();
    cy.wait(500);

    // Ensure cart is empty
    cy.contains("a", "Cart").click();
    cy.get("#alert p").should("contain", "The cart is empty. Please add some products to the cart.");
    cy.wait(500);

    cy.get("#alert button").click();
    cy.wait(1000);
  }

  it("runs the full happy E2E flow", () => {
    cy.visit("/");

    signUp();
    login();
    addUnitToCart("Mens Casual Premium Slim Fit T-Shirts");
    addUnitToCart("SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s", 2);
    openCart();
    fillCheckoutForm();

    cy.get(".utility #optLogout a").click();
    cy.wait(1000);

    // Ensure login link is visible again
    cy.get(".utility #optLogin a").should("be.visible");
  });
});
