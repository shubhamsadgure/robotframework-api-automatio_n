*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Keywords ***
Create Dynamic Pet Body

    ${id}=          Evaluate    random.randint(1000, 9999)    modules=random
    ${name}=        Generate Random String    6    [LETTERS]
    ${tag}=         Generate Random String    5    [LETTERS]
    ${photo}=       Generate Random String    4    [LETTERS]

    ${photo_list}=  Create List    ${photo}

    ${tag_obj}=     Create Dictionary    id=0    name=${tag}
    ${tags}=        Create List    ${tag_obj}

    ${category}=    Create Dictionary    id=0    name=${tag}

    ${body}=    Create Dictionary
    ...    id=${id}
    ...    name=${name}
    ...    photoUrls=${photo_list}
    ...    status=available
    ...    category=${category}
    ...    tags=${tags}

    RETURN    ${body}



Create Dynamic Update Pet Body
    [Arguments]    ${id}

    ${name}=        Generate Random String    6    [LETTERS]
    ${tag}=         Generate Random String    5    [LETTERS]

    ${photo}=       Generate Random String    4    [LETTERS]
    ${photo_list}=  Create List    ${photo}

    ${tag_obj}=     Create Dictionary    id=0    name=${tag}
    ${tags}=        Create List    ${tag_obj}

    ${category}=    Create Dictionary    id=0    name=${tag}

    ${body}=    Create Dictionary
    ...    id=${id}
    ...    name=${name}
    ...    photoUrls=${photo_list}
    ...    status=updated
    ...    category=${category}
    ...    tags=${tags}

    RETURN    ${body}
