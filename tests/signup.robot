*** Settings ***
Documentation    Test suite for the Web App Sign Up page
Resource         ../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Should allow registering a new Dog Walker
    [Tags]    happy_path    smoke
    [Documentation]    Validates navigation to the signup page and checks the form header.

    # 1. Define Test Data (Variables)
    &{dog_walker}        Create Dictionary
    ...                  name=Fernando Papito
    ...                  email=papito@gmail.com
    ...                  cpf=12312314141
    ...                  cep=04534011
    ...                  addressNumber=1000
    ...                  addressDetails=Apto 28
    ...                  cnh=toretto.jpg

    # 2. Keywords Checks
    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.

Should allow registering a new Dog Walker who knows how to care for pets
    [Tags]    a_service

    &{dog_walker}       Create Dictionary
    ...                 name=Dominique Toreto
    ...                 email=toreto@gmail.com
    ...                 cpf=12312314141
    ...                 cep=04534011
    ...                 addressNumber=1000
    ...                 addressDetails=Apto 28
    ...                 cnh=toretto.jpg

    Go To Signup Page
    Fill Signup Form    ${dog_walker}
    Additional Service  Cuidar
    Submit Signup Form
    Popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.

Should allow registering a new Dog Walker who knows how to train pets
    [Tags]    a_service

    &{dog_walker}       Create Dictionary
    ...                 name=Papito Fernando
    ...                 email=papito@o.com
    ...                 cpf=12312314141
    ...                 cep=04534011
    ...                 addressNumber=1000
    ...                 addressDetails=Apto 28
    ...                 cnh=toretto.jpg

    Go To Signup Page
    Fill Signup Form    ${dog_walker}
    Additional Service  Adestrar
    Submit Signup Form
    Popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.

Should not allow registration if CPF is incorrect
    [Tags]    cpf_inv
    [Documentation]    Validates that the system identifies invalid CPF.

    &{dog_walker}        Create Dictionary
    ...                  name=Fernando Papito
    ...                  email=papito@gmail.com
    ...                  cpf=1231231414a
    ...                  cep=04534011
    ...                  addressNumber=1000
    ...                  addressDetails=Apto 28
    ...                  cnh=toretto.jpg

    Go to signup page
    Fill signup form    ${dog_walker}
    Submit signup form
    Alert should be     CPF inválido

Should not allow registration if required fields are empty
    [Tags]    required
    [Documentation]    Validates required fields messages.

    Go to signup page

    # No filling - submit empty form
    Submit signup form

    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CHN)
