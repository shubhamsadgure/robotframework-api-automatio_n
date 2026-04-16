*** Settings ***
Resource    ../resources/keywords/pet_keywords.robot
Resource    ../resources/variables/config.robot
Resource    ../resources/variables/test_data.robot

*** Test Cases ***
Verify Create Pet
    Log To Console    Verifying Create Pet API
    Create API Session


    ${body}=    Create Dynamic Pet Body
    ${response}=    Create Pet    ${body}

    Should Be Equal As Numbers    ${response.status_code}    200

    ${res_json}=    Set Variable    ${response.json()}
    ${id_created}=       Set Variable    ${res_json['id']}
    
    Set Suite Variable    ${id_created}
     
    Should Be Equal As Numbers    ${res_json['id']}    ${body['id']}
    Should Be Equal    ${res_json['name']}    ${body['name']}
    Should Be Equal    ${res_json['status']}    ${body['status']}
    Should Be Equal As Numbers    ${res_json['category']['id']}    ${body['category']['id']}
    Should Be Equal    ${res_json['category']['name']}    ${body['category']['name']}
    Should Be Equal    ${res_json['photoUrls']}    ${body['photoUrls']}
    Should Be Equal As Numbers    ${res_json['tags'][0]['id']}    ${body['tags'][0]['id']}
    Should Be Equal    ${res_json['tags'][0]['name']}    ${body['tags'][0]['name']}


Verify Get Pet By ID
    Log To Console    Verifying Get Pet by ID API
    Create API Session

    ${id}=    Set Variable    ${id_created}

    ${response}=    Get Pet By ID    ${id}

    Log To Console    ${response.status_code}
    Log To Console    ${response.json()}

    Should Be Equal As Numbers    ${response.status_code}    200


Verify Update Pet By ID
    Log To Console    Verifying Update Pet by ID API
    Create API Session

    ${id}=    Set Variable    ${id_created}

    ${update_body}=    Create Dynamic Update Pet Body    ${id}

    ${response}=    Update Pet    ${update_body}

    Log To Console    ${response.status_code}
    Log To Console    ${response.json()}

    Should Be Equal As Numbers    ${response.status_code}    200

    ${json}=    Set Variable    ${response.json()}

    Should Be Equal As Numbers    ${json['id']}    ${update_body['id']}
    Should Be Equal    ${json['name']}    ${update_body['name']}
    Should Be Equal    ${json['status']}    ${update_body['status']}

    Should Be Equal As Numbers    ${json['category']['id']}    ${update_body['category']['id']}
    Should Be Equal    ${json['category']['name']}    ${update_body['category']['name']}

    Should Be Equal    ${json['photoUrls']}    ${update_body['photoUrls']}

    Should Be Equal As Numbers    ${json['tags'][0]['id']}    ${update_body['tags'][0]['id']}
    Should Be Equal    ${json['tags'][0]['name']}    ${update_body['tags'][0]['name']}



Verify Delete Pet By ID
    Log To Console    Verifying Delete Pet API

    ${response}=    Delete Pet By ID    ${id_created}

    ${json}=    Set Variable    ${response.json()}

    Log To Console    ${response.status_code}
    Log To Console    ${response.json()}

    Should Be Equal As Numbers    ${response.status_code}    200

    ${id_str}=    Convert To String    ${id_created}
    Should Be Equal    ${json['message']}    ${id_str}