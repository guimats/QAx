*** Settings ***
Documentation        Cenários de cadastro de tarefas

Resource         ../../resources/base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    ${data}    Get fixtures    tasks    create

    Clean user from database     ${data}[user][email]
    Insert user from database    ${data}[user]

    Submit login form            ${data}[user]
    User should be loged in      ${data}[user][name]

    Go to task form
    Submit task form             ${data}[task]
    Task should be registered    ${data}[task][name]

Não deve cadastrar tarefa duplicada
    [Tags]    dup

    ${data}        Get fixtures    tasks    duplicate
    
    Clean user from database   ${data}[user][email]
    Insert user from database  ${data}[user]
    
    POST user session    ${data}[user]
    POST a new task      ${data}[task]
    
    Submit login form            ${data}[user]
    User should be loged in      ${data}[user][name]

    Go to task form
    Submit task form             ${data}[task]

    Notice should be             Oops! Tarefa duplicada.

Não deve cadastrar nova tarefa quando atinge o limite de tags
    [Tags]    tags_limit

    ${data}        Get fixtures    tasks    tags_limit
    
    Clean user from database   ${data}[user][email]
    Insert user from database  ${data}[user]
    
    Submit login form            ${data}[user]
    User should be loged in      ${data}[user][name]

    Go to task form
    Submit task form             ${data}[task]

    Notice should be             Oops! Limite de tags atingido. 