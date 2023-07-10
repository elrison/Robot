*** Settings ***
Documentation                   Elementos e açoes da página de cadastro

Library                         Browser
Resource                        ../env.resource

*** Keywords ***

Go to signup page
    Go To              ${BASE_URL}/signup
    
    #checkpoint
    Wait For Elements State    css=h1    visible     5
    Get Text                   xpath=//h1    equal    Faça seu cadastro
Submit signup form
    [Arguments]                  ${user}    
    Fill Text                    css=#name             ${user}[name]
    Fill Text                    css=#email            ${user}[email]
    Fill Text                    css=#password         ${user}[password]

    Click                        id=buttonSignup 


  