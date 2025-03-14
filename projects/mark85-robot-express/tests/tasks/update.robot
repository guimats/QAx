*** Settings ***
Documentation        Cenários de testes de atualização de tarefas

Resource         ../../resources/base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder marcar uma tarefa como concluída
    
    ${data}        Get fixtures    tasks    done

    Clean user from database       ${data}[user][email]
    Insert user from database      ${data}[user]

    POST user session              ${data}[user]
    POST a new task                ${data}[task]

    Submit login form              ${data}[user]
    User should be loged in        ${data}[user][name]
    
    Mark task as completed         ${data}[task][name]

    Sleep    4