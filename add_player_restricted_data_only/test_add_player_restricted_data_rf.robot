*** Settings ***
Resource            ../resources.robot
Test Setup          Run Keywords    Login to the system EN
Test Teardown       Run Keywords    Log Out And Close The Browser
Library             SeleniumLibrary
Documentation       Suite description

*** Variables ***
${ADDPLAYERBUTTON}              xpath=//div[2]//a/button
${ADDPLAYERFORMNAME}            xpath=//input[@name='name']
${ADDPLAYERFORMSURNAME}         xpath=//input[@name='surname']
${ADDPLAYERFORMPOSITION}        xpath=//input[@name='mainPosition']
${ADDPLAYERFORMAGE}             xpath=//input[@name='age']
${ADDPLAYERFORMSUBMITBUTTON}    xpath=//main//form/*/button[1]
${MATCHESMENUEXTENSION}         xpath=//span[contains(text(), 'Mecze') or contains(text(), 'Matches')]


*** Test Cases ***
Adding Player - Restricted Data Only
    Click add player button
    Fill in the form
    Assert page redirect

*** Keywords ***
Click add player button
    Wait Until Element Is Visible   ${ADDPLAYERBUTTON}      timeout=20
    Click Button                    ${ADDPLAYERBUTTON}
Fill in the form
    Wait Until Element Is Visible   ${ADDPLAYERFORMNAME}        timeout=20
    Press Keys                      ${ADDPLAYERFORMNAME}        ${SPACE}
    Press Keys                      ${ADDPLAYERFORMSURNAME}     ${SPACE}
    Press Keys                      ${ADDPLAYERFORMPOSITION}    ${SPACE}
    Input Text                      ${ADDPLAYERFORMAGE}         15102024
    Click Button                    ${ADDPLAYERFORMSUBMITBUTTON}
    Sleep                           3s
Assert page redirect
    Wait Until Element Is Visible           ${MATCHESMENUEXTENSION}      timeout=30
    Get Location
    Location Should Contain    edit
    Capture Page Screenshot    alert_add_player_restricted_data.png

