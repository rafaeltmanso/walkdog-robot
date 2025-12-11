*** Settings ***
Documentation    Test suite for the Walk Dog home page
Library          Browser

*** Test Cases ***
Home page must be online
    [Documentation]    Validates that the home page loads and displays the correct slogan.
    
    # 1. Initialize Browser
    New Browser
    
    # 2. Access the Target URL
    New Page       https://walkdog.vercel.app/
    
    # 3. Validation (Assertion)
    # We look for the <h1> tag and check if the text equals the slogan
    Get Text       h1    ==    Cuidado e diversão em cada passo
    
    # 4. Evidence
    Take Screenshot
