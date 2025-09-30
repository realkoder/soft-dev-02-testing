import {defineConfig} from "cypress";

export default defineConfig({
  e2e: {
    specPattern: "test/cypress/**/*.cy.js",
    baseUrl: "http://localhost:3001"
    // setupNodeEvents(on, config) {
    //   // implement node event listeners here
    // },
  },
});
