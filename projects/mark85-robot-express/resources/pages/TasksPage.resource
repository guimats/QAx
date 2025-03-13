*** Settings ***
Documentation        Ações e elementos da página de listagem de tarefas

Library        Browser

*** Keywords ***
Task should be registered
    [Arguments]        ${task_name}

    Wait For Elements State    css=.task-todo >> text=${task_name}
    ...        visible        5

Mark task as completed
    [Arguments]    ${task_name}

    ${element}    Set Variable    
    ...    xpath=//strong[text()="${task_name}"]/..//button[@class="item-toggle"]

    Wait For Elements State    ${element}    visible    5
    Click                      ${element}