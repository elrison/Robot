*** Settings ***
Documentation        Cenarios de testes do cadastro de usuarios

Resource             ../resources/base.resource
#Library              FakerLibrary  (Deve ser usado em Teste em campos que não são chaves)

Suite Setup            Log    Tudo aqui ocorre antes da Suite(Antes de todos os testes)
Suite Teardown         Log    Tudo aqui ocorre depois da Suite(Depois de todos os testes)

Test Setup            Start Session
Test Teardown         Take Screenshot

*** Test Cases ***

Deve poder cadastrar um novo usuário
    [Tags]    cad

    ${user}            Create Dictionary
    ...            name=Elrison Silva
    ...            email=elrison.silva@sidia.com
    ...            password=pdw123
       
    Remove user from database        ${user}[email]

    Go to signup page
    Submit signup form               ${user}
    Notice should be                 Boas vindas ao Mark85, o seu gerenciador de tarefas.
    
     
Não deve permitir com o cadastro duplicado
    [Tags]    dup

    ${user}            Create Dictionary
    ...            name=Elrison Silva
    ...            email=elrison.silva@sidia.com
    ...            password=pdw123

    Remove user from database        ${user}[email]
    Insert user from database        ${user}
    
    Go to signup page
    Submit signup form               ${user}
    Notice should be                 Oops! Já existe uma conta com o e-mail informado.
   
Campos Obrigatórios
    [Tags]                          required

    ${user}                         Create Dictionary

    ...                             name=${EMPTY}
    ...                             email=${EMPTY}
    ...                             password=${EMPTY}
       
    Go to signup page
    Submit signup form             ${user}

    Alert Should Be                Informe seu nome completo
    Alert Should Be                Informe seu e-email
    Alert Should Be                Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com email incorreto

    [Tags]                         email_incorreto

    ${user}                        Create Dictionary

    ...                             name=Elrison Silva
    ...                             email=elrison.com
    ...                             password=123456
    
    Go to signup page
    Submit signup form             ${user}
    Alert Should Be                Digite um e-mail válido

Não deve cadastrar com senha muito curta
    [Tags]                  temp
    @{password_list}        Create List        1   12   123   1234   12345

    FOR  ${password}  IN  @{password_list}
         ${user}                         Create Dictionary

    ...                             name=${EMPTY}
    ...                             email=${EMPTY}
    ...                             password=${password}
       
    Go to signup page
    Submit signup form             ${user}

    Alert Should Be                Informe seu nome completo
    Alert Should Be                Informe seu e-email
    Alert Should Be                Informe uma senha com pelo menos 6 digitos
    
    END

    Sleep    5
    

Não deve cadastrar com senha de 1 digito

    [Tags]                          short_pass
    [Template]
    Short Password                   1

Não deve cadastrar com senha de 2 digito

    [Tags]                          short_pass
    [Template]
    Short Password                   12
Não deve cadastrar com senha de 3 digito

    [Tags]                          short_pass
    [Template]
    Short Password                   123
Não deve cadastrar com senha de 4 digito

    [Tags]                          short_pass
    [Template]
    Short Password                   1234
Não deve cadastrar com senha de 5 digito

    [Tags]                          short_pass
    [Template]
    Short Password                   12345

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


  