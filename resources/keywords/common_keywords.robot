*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   ../variables/config.robot

*** Keywords ***
Create API Session
    Create Session    mysession    ${BASE_URL}

Post Request pet
    [Arguments]    ${endpoint}    ${body}

    ${headers}=    Create Dictionary    Content-Type=application/json

    ${response}=    POST On Session
    ...    mysession
    ...    ${endpoint}
    ...    json=${body}
    ...    headers=${headers}

    RETURN    ${response}


Get Request Pet
    [Arguments]    ${endpoint}

    ${response}=    GET On Session
    ...    mysession
    ...    ${endpoint}

    RETURN    ${response}


Put Request Pet
    [Arguments]    ${body}

    ${headers}=    Create Dictionary    Content-Type=application/json

    ${response}=    PUT On Session
    ...    mysession
    ...    /pet
    ...    json=${body}
    ...    headers=${headers}

    RETURN    ${response}


Delete Request Pet
    [Arguments]    ${endpoint}

    ${response}=    DELETE On Session
    ...    mysession
    ...    ${endpoint}

    RETURN    ${response}