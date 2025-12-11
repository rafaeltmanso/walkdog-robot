*** Settings ***
Documentation    Keywords shared for the Sign Up page
Library          Browser

*** Keywords ***
Go to signup page
    Click    css=a[href="/signup"]
    Wait For Elements State    form h1    visible    5
    Get Text       form h1    equal    Faça seu cadastro

Fill signup form
    [Arguments]    ${dog_walker}
    Fill Text      css=input[name="name"]             ${dog_walker}[name]
    Fill Text      css=input[name="email"]            ${dog_walker}[email]
    Fill Text      css=input[name="cpf"]              ${dog_walker}[cpf]
    Fill Text      css=input[name="cep"]              ${dog_walker}[cep]
    
    Click          css=input[type=button][value="Buscar CEP"]
    
    Fill Text      css=input[name="addressNumber"]    ${dog_walker}[addressNumber]
    Fill Text      css=input[name="addressDetails"]   ${dog_walker}[addressDetails]
    
    Upload File By Selector    css=input[type="file"]    ${EXECDIR}/resources/fixtures/${dog_walker}[cnh]

Additional Service
    [Arguments]    ${additional_service}
    
    ${xpath}=    Set Variable    //span[text()='${additional_service}']/..
    Click        xpath=${xpath}

Submit signup form
    Click          css=.button-register

Popup should be
    [Arguments]    ${expected_text}
    Wait For Elements State    css=.swal2-html-container    visible    5
    Get Text                   css=.swal2-html-container    equal      ${expected_text}

Alert should be
    [Arguments]    ${expected_text}
    Wait For Elements State    .alert-error >> text=${expected_text}    visible    5
