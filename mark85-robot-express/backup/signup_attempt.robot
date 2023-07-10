*** Settings ***

Documentation                          Cenarios de tentativa de cadastro com senha curta.

Resource                               ../resources/base.resource
Test Template                          Short Password

Test Setup            Start Session
Test Teardown         Take Screenshot

*** Test Cases ***
Não deve logar com senha de 1 digitos     1
Não deve logar com senha de 2 digitos     12
Não deve logar com senha de 3 digitos     123
Não deve logar com senha de 4 digitos     1234
Não deve logar com senha de 5 digitos     12345


*** Keywords ***
Short Password
    [Arguments]                     ${short_pass}

    ${user}                         Create Dictionary

    ...                             name=${EMPTY}
    ...                             email=${EMPTY}
    ...                             password=${short_pass}
       
    Go to signup page
    Submit signup form             ${user}

    Alert Should Be                Informe seu nome completo
    Alert Should Be                Informe seu e-email
    Alert Should Be                Informe uma senha com pelo menos 6 digitos