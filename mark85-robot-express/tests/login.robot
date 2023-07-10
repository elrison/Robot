*** Settings ***
Documentation                      Cenarios de autenticação 

Resource                           ../resources/base.resource
Resource                           ../resources/pages/loginPage.resource

Test Setup                          Start Session
Test Teardown                       Take Screenshot
Library                             Collections

*** Test Cases ***
Deve poder logar com um usuário pré-cadastrado

    ${user}                      Create Dictionary
    ...                          name=elrison gomes
    ...                          email=elrison.gomes1@gmail.com
    ...                          password=123456
    
    Remove user from database        ${user}[email]
    Insert user from database        ${user}
    
    Submit login form                ${user}
    User should be logged in         ${user}[name]

Não deve logar com senha inválida
    ${user}                      Create Dictionary
    ...                          name=Steve Woz
    ...                          email=woz@apple.com
    ...                          password=123456
    
    Remove user from database        ${user}[email]
    Insert user from database        ${user}

    Set To Dictionary                ${user}             password=abc123
    
    Submit login form                ${user}
    Notice should be                 Ocorreu um erro ao fazer login, verifique suas credenciais.