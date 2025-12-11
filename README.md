# 🤖 WalkDog Robot

> **Automated E2E Testing Project for the WalkDog Application**

[![Robot Framework](https://img.shields.io/badge/Robot%20Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)](https://robotframework.org/)
[![Playwright](https://img.shields.io/badge/Playwright-45ba4b?style=for-the-badge&logo=Playwright&logoColor=white)](https://playwright.dev/)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)

This project contains the **End-to-End (E2E)** automated test suite for the **WalkDog** web application. It was built using **Robot Framework** with the **Browser Library** (based on Playwright), following best practices for software architecture, code reusability, and maintainability.

---

## 🚀 Features & Scenarios

The automation covers critical flows of the WalkDog registration process, ensuring the application handles both valid and invalid data correctly.

- **✅ Happy Path:**
  - Verify successful registration of a new Dog Walker.
  - Flexible support for optional fields (*Additional Services* like "Care" or "Train").
- **❌ Sad Paths:**
  - validation of invalid CPF format.
  - Verification of all required field error messages when submitting an empty form.
- **✨ Advanced Capabilities:**
  - **Dynamic Data:** Utilization of "Super Variables" (Dictionaries) for test data management.
  - **Custom Actions:** Encapsulation of logic into reusable Keywords (Action Object Pattern).
  - **Multi-Browser Support:** Configurable execution for Chromium, Firefox, and WebKit.
  - **Screenshots:** Automatic full-page evidence capture on test completion.

## 📂 Project Structure

The project follows a modular architecture to separate concerns between test scenarios, page actions, and configuration.

```text
WalkDog-Robot/
├── resources/
│   ├── actions/
│   │   └── signup.resource   # Keywords and locators specific to the Signup page
│   ├── fixtures/             # Static assets (e.g., images for upload)
│   ├── base.resource         # Setup, Teardown, and common configurations
│   └── env.resource          # Environment variables (Browser selection)
├── tests/
│   └── signup.robot          # Test Suites and Gherkin-style test cases
├── logs/                     # Execution reports and screenshots
└── README.md                 # Project documentation
```

## 🛠️ Prerequisites

Before running the tests, ensure you have the following installed:

- [Python 3.8+](https://www.python.org/downloads/)
- [Node.js](https://nodejs.org/) (required for Playwright)
- Robot Framework & Browser Library:
  ```bash
  pip install robotframework robotframework-browser
  rfbrowser init
  ```

## 🏃‍♂️ How to Run

### Standard Execution (Chromium)
Run all tests using the default configuration:
```bash
robot -d ./logs tests/signup.robot
```

### 🏷️ Run by Tags
Execute specific scenarios using tags:
- **Smoke Tests** (Main success flow):
  ```bash
  robot -d ./logs -i smoke tests/signup.robot
  ```
- **Additional Services** (Optional fields):
  ```bash
  robot -d ./logs -i a_service tests/signup.robot
  ```
- **Required Fields Validation**:
  ```bash
  robot -d ./logs -i required tests/signup.robot
  ```

### 🌐 Cross-Browser Testing
Override the default browser variable via CLI to test on different engines:

**Firefox:**
```bash
robot -d ./logs -v BROWSER:firefox tests/signup.robot
```

**WebKit (Safari Engine):**
```bash
robot -d ./logs -v BROWSER:webkit tests/signup.robot
```

## 🤝 Credits

- **App Development:** The WalkDog web application was developed by [**Fernando Papito**](https://github.com/papitodev)).
- **Automation Author:** This automation project was developed by [**Rafael Manso**](https://github.com/rafaeltmanso).




