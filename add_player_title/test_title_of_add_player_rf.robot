*** Settings ***
Library         SeleniumLibrary
Documentation   Suite description
Resource        ../resources.robot
Test Setup      Run Keywords    Login to the system EN
Test Teardown   Run Keywords    Log Out And Close The Browser

*** Variables ***
${ADDPLAYERBUTTON}      xpath=//div[2]//a/button
${ADDPLAYERFORMNAME}    xpath=//input[@name='name']


*** Test Cases ***
Title of add player page
    Click add player button
    Assert title of page

*** Keywords ***
Click add player button
    Wait Until Element Is Visible   ${ADDPLAYERBUTTON}  timeout=20
    Click Button                    ${ADDPLAYERBUTTON}
    Sleep                           3s

Assert title of page
    Wait Until Element Is Visible   ${ADDPLAYERFORMNAME}    timeout=20
    Get Title
    Title Should Be                 Add player
    Capture Page Screenshot         alert_title_of_add_player.png


