*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   ../keywords/common_keywords.robot
Resource   ../variables/endpoints.robot



*** Keywords ***
Create Pet
    [Arguments]    ${body}
    ${response}=    Post Request pet    ${PET}    ${body}
    RETURN    ${response}


Get Pet By ID
    [Arguments]    ${id}
    ${endpoint}=    Set Variable    /pet/${id}
    ${response}=    Get Request Pet    ${endpoint}
    RETURN    ${response}


Update Pet
    [Arguments]    ${body}

    ${response}=    Put Request Pet    ${body}

    RETURN    ${response}


Delete Pet By ID
    [Arguments]    ${id}

    ${endpoint}=    Set Variable    /pet/${id}

    ${response}=    Delete Request Pet    ${endpoint}

    RETURN    ${response}

