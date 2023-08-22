*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description
Resource        resources.robot
Test Setup      Run Keywords    Login to the system EN
Test Teardown   Run Keywords    Log Out And Close The Browser

*** Variables ***
${ADDPLAYERBUTTON}      xpath=//div[2]//a/button

*** Test Cases ***
Login to the system with English
    Assert title of page

*** Keywords ***
Assert title of page
    Wait Until Element Is Visible   ${ADDPLAYERBUTTON}  timeout=20
    Get Title
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert_login_to_the_system.png


