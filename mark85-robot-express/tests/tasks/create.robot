*** Settings ***
Documentation                         Cenarios de cadstro de taerfas

Resource                             ../../resources/base.resource
Library                               JSONLibrary

*** Test Cases ***
Deve poder cadastrar uma nova tarefa

    ${data}               Get fixture    tasks    create
    
    Log                   ${data} [create][user]