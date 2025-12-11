*** Settings ***
Documentation       Main project file

Library             Browser

Resource            actions/signup.resource
Resource            env.resource

*** Keywords ***
Start Session
    New Browser    browser=${BROWSER}    headless=True
    New Page       https://walkdog.vercel.app/

    # Checkpoint to ensure we are on the home page
    Wait For Elements State    css=h1 >> text=Cuidado e diversão em cada passo
    ...                         visible    5

Finish Session
    Take Screenshot    fullPage=true
