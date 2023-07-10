*** Settings ***

Library                      libs/database.py
Library                      Browser
Library    JSONLibrary

Resource                     env.resource

Resource                     pages/componentes/Notice.resource
Resource                     pages/componentes/Header.resource
Resource                     pages/componentes/Alert.resource

Resource                     pages/signupPage.resource
Resource                     pages/loginPage.resource


*** Keywords ***
Start Session

    New Browser    browser=chromium    headless=false
    New Page       ${BASE_URL}  


Short Password
    [Arguments]                     ${short_pass}

    ${user}                         Create Dictionary

    ...                             name=${EMPTY}
    ...                             email=${EMPTY}
    ...                             password=${short_pass}
       
    Go to signup page
    Submit signup form             ${user}

#helpers
Get fixture
    [Arguments]                    ${file_name}          ${scenario}

    ${data}                    Load Json From File            
    ...    ${EXECDIR}/resources/fixtures/tasks.json
    ...    encoding=utf-8
    [Return]                        ${data} [create] [scenario]        
    

    