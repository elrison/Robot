*** Settings ***
Documentation             Açoes e elementos da pagina de login

Library                   Browser

*** Keywords ***
Submit login form
    [Arguments]           ${user}

    Fill Text             css=input[placeholder$=mail]         ${user}[email]   
    Fill Text             css=input[placeholder$=nha]          ${user}[password]

    Click                 css=button >> text=Entrar    




