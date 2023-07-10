*** Settings ***
Documentation                   Ações e elementos dos componentes de mensagens de alerta

Library                         Browser
                     
*** Keywords ***
Alert Should Be
    [Arguments]                  ${expected_text}

    Wait For Elements State    css=.alert-error >> text=${expected_text}
    ...                        visible               5


   