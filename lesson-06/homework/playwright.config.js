import {defineConfig, devices} from "@playwright/test";

export default defineConfig({
  testDir: "./test/playwright",
  testMatch: ["**/*.spec.js"],
  use: {
    baseURL: "http://localhost:3001",
    headless: false,
  },
});